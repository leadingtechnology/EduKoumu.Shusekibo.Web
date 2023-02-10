import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/widget/dantai/dantai_model.dart';
import 'package:shusekibo/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/widget/dantai/dantai_state.dart';

abstract class DantaiRepositoryProtocol {
  Future<DantaiState> fetch();
}

final dantaiRepositoryProvider = Provider(DantaiRepository.new);

class DantaiRepository implements DantaiRepositoryProtocol {
  DantaiRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<DantaiState> fetch() async {
    final response = await _api.get('api/dantai');

    response.when(
        success: (success) {},
        error: (error) {
          return DantaiState.error(error);
        },);

    if (response is APISuccess) {
      final value = response.value;
      try {
        final dantai = dantaiListFromJson(value as List<dynamic>);
        _ref.read(dantaiProvider.notifier).state = dantai.first;

        return DantaiState.loaded(dantai);
      } catch (e) {
        return DantaiState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return DantaiState.error(response.exception);
    } else {
      return const DantaiState.loading();
    }
  }
}
