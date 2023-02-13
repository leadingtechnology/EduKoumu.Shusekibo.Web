import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/feature/auth/model/auth_state.dart';
import 'package:shusekibo/app/feature/auth/repository/auth_repository.dart';
import 'package:shusekibo/shared/model/token.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';

final tokenProvider = StateProvider<Token>((ref) => const Token());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._ref) : super(const AuthState.initial());

  final Ref _ref;
  late final AuthRepository _loginRepository =
      _ref.read(authRepositoryProvider);
  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);      

  Future<void> login(String email, String password) async {
    state = await _loginRepository.login(email, password);
  }

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const AuthState.loggedOut();
  }
  
  Future<void> signUp(String name, String email, String password) async {
    state = await _loginRepository.signUp(name, email, password);
  }
}
