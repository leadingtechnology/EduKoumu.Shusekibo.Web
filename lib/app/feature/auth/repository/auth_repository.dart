import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shusekibo/app/feature/auth/model/auth_state.dart';
import 'package:shusekibo/app/feature/auth/provider/auth_provider.dart';
import 'package:shusekibo/app/widget/cache/cache_provider.dart';
import 'package:shusekibo/app/widget/dantai/dantai_model.dart';
import 'package:shusekibo/app/widget/dantai/dantai_provider.dart';
import 'package:shusekibo/shared/http/api_provider.dart';
import 'package:shusekibo/shared/http/api_response.dart';
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

        // ???????????????
        final response = await _api.get('api/dantai');
        response.when(
          success: (success) {},
          error: (error) {
            return AuthState.error(error);
          },
        );

        if (response is APISuccess) {
          final value = response.value;
          try {
            final dantai = dantaiListFromJson(value as List<dynamic>);

            _ref.read(dantaiProvider.notifier).state = dantai.first;
            _ref.read(dantaiCache.notifier).state['${token.LoginId}'] = dantai;

          } catch (e) {
            return AuthState.error(
                AppException.errorWithMessage(e.toString()),);
          }
        } else if (response is APIError) {
          return AuthState.error(response.exception);
        } else {
          return const AuthState.loading();
        }

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
