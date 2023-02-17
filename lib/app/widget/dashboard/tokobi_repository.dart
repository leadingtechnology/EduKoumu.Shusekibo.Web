import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';
import 'package:shusekibo/app/widget/dashboard/tokobi_model.dart';
import 'package:shusekibo/app/widget/dashboard/tokobi_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class TokobiRepositoryProtocol {
  Future<AppState> fetch(ShozokuModel shozoku, DateTime tokobiDate); 
}

final tokobiRepositoryProvider = Provider(TokobiRepository.new);

class TokobiRepository implements TokobiRepositoryProtocol {
  TokobiRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch(ShozokuModel shozoku, DateTime tokobiDate) async {
    final  kouryu = _ref.read(kouryuProvider);

    final strDate = DateFormat('yyyy-MM-dd').format(tokobiDate);
    final strY = strDate.substring(0, 3);
    final strM = strDate.substring(5, 6);

    var url = 'api/shozoku/${shozoku.shozokuId}/ShukketsuShussekibo';
    url = '$url?year=$strY&month=$strM';
    url = '$url&kouryuGakkyu=${kouryu ? 'true' : 'false'}';
    final response = await _api.get(url);

    response.when(
        success: (success) {},
        error: (error) {return AppState.error(error);}
    );

    if (response is APISuccess) {
      final value = response.value;
      try {

        // 1) get the list
        final tokobiList = tokobiListFromJson(value as List<dynamic>);

        if (tokobiList.isNotEmpty) {
          _ref.read(tokobiProvider.notifier).state = tokobiList.first;
        }
        _ref.read(tokobiCache.notifier).state['${shozoku.id}-$strDate'] =
            tokobiList;

        return const AppState.loaded();
      } catch (e) {
        return AppState.error(
            AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return AppState.error(response.exception);
    } else {
      return const AppState.loading();
    }
  }
}
