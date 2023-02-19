import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shusekibo/app/widget/attendance/timed_model.dart';
import 'package:shusekibo/app/widget/attendance/timed_provider.dart';
import 'package:shusekibo/app/widget/attendance/timed_state.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_model.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class TimedRepositoryProtocol {
  Future<TimedState> fetch(ShozokuModel shozoku, DateTime targetDate); 
}

final timedRepositoryProvider = Provider(TimedRepository.new);

class TimedRepository implements TimedRepositoryProtocol {
  TimedRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<TimedState> fetch(ShozokuModel shozoku, DateTime targetDate) async {

    final strDate = DateFormat('yyyy-MM-dd').format(targetDate);

    final url = 'api/shozoku/${shozoku.shozokuId}/JigenList?date=$strDate';
    final response = await _api.get(url);

    response.when(
        success: (success) {},
        error: (error) {return TimedState.error(error);},
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        
        // 1) get the list
        final timedList = timedListFromJson(value as List<dynamic>);

        if (timedList.isNotEmpty){
          _ref.read(timedProvider.notifier).state = timedList.first;
        }
        _ref.read(timedCache.notifier).state['${shozoku.id}-$strDate'] =
            timedList;

        return const TimedState.loaded();
      } catch (e) {
        return TimedState.error(
            AppException.errorWithMessage(e.toString()),);
      }
    } else if (response is APIError) {
      return TimedState.error(response.exception);
    } else {
      return const TimedState.loading();
    }
  }
}
