import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/feature/auth/model/auth_state.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_repository.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/model/token.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';
import 'package:shusekibo/shared/util/validator.dart';

abstract class AuthRepositoryProtocol {
  Future<AuthState> login(String email, String password);
  Future<AuthState> signUp(String name, String email, String password);
}

final authRepositoryProvider = Provider(AuthRepository.new);

class AuthRepository implements AuthRepositoryProtocol {
  AuthRepository(this._ref);

  late final ApiProvider _api = _ref.read(apiProvider);
  final Ref _ref;
  late final DantaiRepository _dantaiRep = _ref.read(dantaiRepositoryProvider);

  @override
  Future<AuthState> login(String email, String password) async {
    // if (!Validator.isValidPassWord(password)) {
    //   return const AuthState.error(
    //       AppException.errorWithMessage('Minimum 8 characters required'));
    // }
    // if (!Validator.isValidEmail(email)) {
    //   return const AuthState.error(
    //       AppException.errorWithMessage('Please enter a valid email address'));
    // }
    // final params = {
    //   'email': email,
    //   'password': password,
    // };

    var tenantId = '';
    if (dotenv.env['TENANT_ID'] != null) {
      tenantId = dotenv.env['TENANT_ID']!;
    }
    final params =
        'grant_type=password&username=$tenantId,$email&password=$password';

    final loginResponse = await _api.post('token', params);

    return loginResponse.when(
      success: (success) async {
        final token = tokenFromJson(json.encode(success));
     
        final tokenRepository = _ref.read(tokenRepositoryProvider);
        await tokenRepository.saveToken(token);

        _ref.read(tokenProvider.notifier).state = token;

        // 団体の取得
        await _dantaiRep.fetch();

        return const AuthState.loggedIn();
      }, 
      error: (error) {
        return AuthState.error(error);
      },
    );
  }

  @override
  Future<AuthState> signUp(String name, String email, String password) async {
    if (!Validator.isValidPassWord(password)) {
      return const AuthState.error(
        AppException.errorWithMessage('Minimum 8 characters required'),
      );
    }
    if (!Validator.isValidEmail(email)) {
      return const AuthState.error(
        AppException.errorWithMessage('Please enter a valid email address'),
      );
    }
    final params = {
      'name': name,
      'email': email,
      'password': password,
    };
    final loginResponse = await _api.post('sign_up', jsonEncode(params));

    return loginResponse.when(success: (success) async {
      final tokenRepository = _ref.read(tokenRepositoryProvider);

      final token = Token.fromJson(success as Map<String, dynamic>);

      await tokenRepository.saveToken(token);

      return const AuthState.loggedIn();
    }, error: (error) {
      return AuthState.error(error);
    },);
  }
}
