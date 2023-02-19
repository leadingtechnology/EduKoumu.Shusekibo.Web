import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_model.dart';
import 'package:shusekibo/app/widget/awareness/awareness_bunrui_provider.dart';
import 'package:shusekibo/app/widget/awareness/awareness_meibo_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/common/app_state.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';

abstract class AwarenessBunruiRepositoryProtocol {
  Future<AppState> fetch();
}

final awarenessBunruiRepositoryProvider =
    Provider(AwarenessBunruiRepository.new);

class AwarenessBunruiRepository implements AwarenessBunruiRepositoryProtocol {
  AwarenessBunruiRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;

  @override
  Future<AppState> fetch() async {
    final response = await _api.get('api/kizuki/Bunrui');

    response.when(
      success: (success) {},
      error: (error) {
        return AppState.error(error);
      },
    );

    if (response is APISuccess) {
      final value = response.value;
      try {
        final bunrui = awarenessBunruiListFromJson(value as List<dynamic>);

        final token = _ref.read(tokenProvider);

        if (bunrui.isNotEmpty) {
          _ref.read(bunruiProvider.notifier).state = bunrui.first;
          _ref.read(awarenessBunruiProvider.notifier).state =
              '${bunrui.first.code}';
        }
        _ref.read(bunruiCache.notifier).state['${token.LoginId}'] = bunrui;

        return const AppState.loaded();
      } catch (e) {
        return AppState.error(AppException.errorWithMessage(e.toString()));
      }
    } else if (response is APIError) {
      return AppState.error(response.exception);
    } else {
      return const AppState.loading();
    }
  }
}
