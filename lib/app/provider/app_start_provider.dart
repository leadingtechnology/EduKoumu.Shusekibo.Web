import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/model/auth_state.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/feature/navigation/nav_bar.dart';
import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';

final appStartProvider =
    StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  final loginState = ref.watch(authProvider);
  final menuId = ref.watch(menuIdProvider);

  late AppStartState appStartState;
  appStartState = loginState is AppAuthenticated
      ? AppStartState.authenticated(menuId)
      : const AppStartState.initial();

  return AppStartNotifier(appStartState, ref, loginState, menuId);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
      super.appStartState, this._ref, this._authState, this._menuId) {
    _init();
  }

  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);
  final AuthState _authState;
  final Ref _ref;
  final int _menuId;

  Future<void> _init() async {
    _authState.maybeWhen(
      loggedIn: () {
        state = AppStartState.authenticated(_menuId);
      // ignore: no-empty-block
      }, orElse: () {  },
    );

    final token = await _tokenRepository.fetchToken();
    if (token != null) {
      if (mounted) {
        state = AppStartState.authenticated(_menuId);
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
