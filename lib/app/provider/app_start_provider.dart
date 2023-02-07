import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/state/app_start_state.dart';
import 'package:shusekibo/feature/auth/model/auth_state.dart';
import 'package:shusekibo/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';

final appStartProvider =
    StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  
  final authState = ref.watch(authProvider);

  AppStartState appStartState;
  appStartState = const AppStartState.initial();

  return AppStartNotifier(appStartState, ref, authState);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
      super.appStartState, this._ref, this._authState,) {
    _init();
  }

  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);
  final AuthState _authState;
  final Ref _ref;

  Future<void> _init() async {
    _authState.maybeWhen(
      loggedIn: () {
        state = const AppStartState.authenticated();
      },
      orElse: () {
        state = const AppStartState.unauthenticated();
      },
    );

    final token = await _tokenRepository.fetchToken();
    if (token != null) {
      if (mounted) {
        state = const AppStartState.authenticated();
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
