import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

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
    final token = _ref.read(tokenProvider);
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
        _ref.read(dantaiCache.notifier).state['${token.LoginId}'] = dantai;

        return const DantaiState.loaded();
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
