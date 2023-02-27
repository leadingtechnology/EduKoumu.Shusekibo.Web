import 'dart:html' as html;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shusekibo/app/feature/auth/model/auth_state.dart';
import 'package:shusekibo/app/feature/auth/repository/auth_repository.dart';
import 'package:shusekibo/app/widget/attendance/timed_repository.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/app/widget/filter/filter_provider.dart';
import 'package:shusekibo/app/widget/gakunen/gakunen_repository.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_provider.dart';
import 'package:shusekibo/app/widget/shozoku/shozoku_repository.dart';
import 'package:shusekibo/shared/model/token.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';

final tokenProvider = StateProvider<Token>((ref) => const Token());

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._ref) : super(const AuthState.initial());

  final Ref _ref;
  late final AuthRepository _loginRep = _ref.read(authRepositoryProvider);
  late final TokenRepository tokenRep = _ref.read(tokenRepositoryProvider);    
  late final GakunenRepository _gkRep = _ref.read(gakunenRepositoryProvider);
  late final ShozokuRepository _szkRep = _ref.read(shozokuRepositoryProvider);
  late final TimedRepository _timedRep = _ref.read(timedRepositoryProvider);


  Future<void> login(String email, String password) async {
    state = await _loginRep.login(email, password);
    // マスタの取得
    final dantai = _ref.read(dantaiProvider);
    await _gkRep.fetch(dantai);
    await _szkRep.fetch(dantai);
    final shozoku = _ref.read(shozokuProvider);
    await _timedRep.fetch(shozoku, DateTime.now());
    _ref.read(filterInitProvider.notifier).update();
  }

  Future<void> logout() async {
    await tokenRep.remove();
    html.window.location.reload();
  }
  
  Future<void> signUp(String name, String email, String password) async {
    state = await _loginRep.signUp(name, email, password);
  }
}
