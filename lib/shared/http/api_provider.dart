import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:shusekibo/shared/http/api_response.dart';
import 'package:shusekibo/shared/http/app_exception.dart';
import 'package:shusekibo/shared/http/interceptor/dio_connectivity_request_retrier.dart';
import 'package:shusekibo/shared/http/interceptor/retry_interceptor.dart';
import 'package:shusekibo/shared/repository/token_repository.dart';

enum ContentType { urlEncoded, json }

final apiProvider = Provider<ApiProvider>(
  ApiProvider.new,
);

class ApiProvider {
  ApiProvider(this._ref) {
    _dio = Dio();
    _dio.options.sendTimeout = 3000;     // 
    _dio.options.connectTimeout = 3000;  // 
    _dio.options.receiveTimeout = 3000;  // 
    _dio.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: _dio,
          connectivity: Connectivity(),
        ),
      ),
    );

    HttpClientAdapter client;
    if (kIsWeb) {
      client = BrowserHttpClientAdapter();
    } else {
      client = DefaultHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          client
            ..badCertificateCallback =
                (X509Certificate cert, String host, int port) => true;
        };
    }

    _dio.httpClientAdapter = client;

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: false));
    }

    if (dotenv.env['BASE_URL'] != null) {
      _baseUrl = dotenv.env['BASE_URL']!;
    }

    if (dotenv.env['TENANT_ID'] != null) {
      _tenantId = dotenv.env['TENANT_ID']!;
    }
  }

  final Ref _ref;

  late Dio _dio;

  late final TokenRepository _tokenRepository =
      _ref.read(tokenRepositoryProvider);

  late String _baseUrl;
  late String _tenantId;

  Future<APIResponse> post(
    String path,
    dynamic body, {
    String? token,
    ContentType contentType = ContentType.json,
  }) async {
    Map<String, String?>? query;

    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url = _baseUrl + path;

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };
      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken}';
      }
      //Sometime for some specific endpoint it may require to use different Token
      if (token != null) {
        headers['Authorization'] = 'Bearer ${token}';
      }

      final response = await _dio.post(
        url,
        data: body,
        //queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        if (response.data['data'] != null) {
          return APIResponse.success(response.data['data']);
        } else {
          return APIResponse.success(response.data);
        }
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(AppException.errorWithMessage(
                response.data['message'] as String));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } catch (e) {
      if (e is DioError) {
        if (e.error is SocketException) {
          return const APIResponse.error(AppException.connectivity());
        }
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          return const APIResponse.error(AppException.connectivity());
        }

        if (e.response != null) {
          if (e.response!.data['message'] != null) {
            return APIResponse.error(AppException.errorWithMessage(
                e.response!.data['message'] as String));
          }
        }
        return APIResponse.error(AppException.errorWithMessage(e.message));
      } else {
        return APIResponse.error(AppException.errorWithMessage(e.toString()));
      }
    }
  }

  Future<APIResponse> get(
    String path, {
    String? token,
    ContentType contentType = ContentType.json,
  }) async {
    Map<String, dynamic>? query;

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url = _baseUrl + path;

    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json; charset=utf-8';
    }

    final headers = {
      'accept': '*/*',
      'Content-Type': content,
    };

    final _appToken = await _tokenRepository.fetchToken();
    if (_appToken != null) {
      headers['Authorization'] = 'Bearer ${_appToken.access_token}';
    }

    try {
      final response = await _dio.get(
        url,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );
      if (response == null) {
        return const APIResponse.error(AppException.error());
      }
      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        if (response.statusCode! == 404) {
          return const APIResponse.error(AppException.connectivity());
        } else if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['error'] != null) {
            return APIResponse.error(
              AppException.errorWithMessage(
                response.data['error'] as String,
              ),
            );
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          print('data : ${e.response?.data}');
          print('headers : ${e.response?.headers}');
          print('requestOptions : ${e.response?.requestOptions}');
        } else {
          // Something happened in setting up or sending the request that triggered an Error
          print('requestOptions : ${e.requestOptions}');
          print('message : ${e.message}');
        }

        if (e.error is SocketException) {
          return const APIResponse.error(AppException.connectivity());
        }
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout ||
            e.type == DioErrorType.sendTimeout) {
          return const APIResponse.error(AppException.connectivity());
        }

        return const APIResponse.error(AppException.error());
      } else {
        return APIResponse.error(AppException.errorWithMessage(e.toString()));
      }
    }
  }

  //
  Future<APIResponse> post2(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };

      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken.access_token}';
      }

      final response = await _dio.post(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(
                AppException.errorWithMessage(response.toString()?? ''));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.toString()));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      return APIResponse.error(
          AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> patch(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };

      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken.access_token}';
      }

      final response = await _dio.patch(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(
                AppException.errorWithMessage(response.toString()));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.response.toString()));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      return APIResponse.error(
          AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }

  Future<APIResponse> delete(
    String path,
    dynamic body, {
    String? newBaseUrl,
    String? token,
    Map<String, String?>? query,
    ContentType contentType = ContentType.json,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return const APIResponse.error(AppException.connectivity());
    }
    String url;
    if (newBaseUrl != null) {
      url = newBaseUrl + path;
    } else {
      url = this._baseUrl + path;
    }
    var content = 'application/x-www-form-urlencoded';

    if (contentType == ContentType.json) {
      content = 'application/json';
    }

    try {
      final headers = {
        'accept': '*/*',
        'Content-Type': content,
      };

      final _appToken = await _tokenRepository.fetchToken();
      if (_appToken != null) {
        headers['Authorization'] = 'Bearer ${_appToken.access_token}';
      }

      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: query,
        options: Options(validateStatus: (status) => true, headers: headers),
      );

      if (response.statusCode == null) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (response.statusCode! < 300) {
        return APIResponse.success(response.data);
      } else {
        // if (response.statusCode! == 404) {
        //   return const APIResponse.error(AppException.connectivity());
        // } else
        if (response.statusCode! == 401) {
          return APIResponse.error(AppException.unauthorized());
        } else if (response.statusCode! == 502) {
          return const APIResponse.error(AppException.error());
        } else {
          if (response.data['message'] != null) {
            return APIResponse.error(
                AppException.errorWithMessage(response.toString()));
          } else {
            return const APIResponse.error(AppException.error());
          }
        }
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        return const APIResponse.error(AppException.connectivity());
      }
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout) {
        return const APIResponse.error(AppException.connectivity());
      }

      if (e.response != null) {
        if (e.response!.data['message'] != null) {
          return APIResponse.error(
              AppException.errorWithMessage(e.response.toString()));
        }
      }
      return APIResponse.error(AppException.errorWithMessage(e.message));
    } on Error catch (e) {
      return APIResponse.error(
          AppException.errorWithMessage(e.stackTrace.toString()));
    }
  }
}
