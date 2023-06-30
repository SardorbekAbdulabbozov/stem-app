// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:retrofit/retrofit.dart';
import 'package:team_project/src/data/network_models/login_request.dart';
import 'package:team_project/src/data/network_models/register_request.dart';
import 'package:team_project/src/data/network_models/auth_response.dart';
import 'package:team_project/src/utils/app_constants.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseURL)
abstract class ApiClient {
  static ApiClient? _apiClient;

  static CancelToken cancelToken = CancelToken();

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        refreshTokenFunction: () async {
          cancelToken.cancel();
        },
        toNoInternetPageNavigator: () async {},
        forbiddenFunction: () async {},
      ),
    );
    dio.interceptors.add(
        LogInterceptor(responseBody: true, requestBody: true, request: true));
    return dio;
  }

  static ApiClient getInstance({String baseUrl = AppConstants.baseURL}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  static removeApiClient() {
    _apiClient = null;
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 30000),
      connectTimeout: const Duration(milliseconds: 30000),
    );
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST("auth/register")
  Future<AuthResponse> register(@Body() RegisterRequest request);

  @POST("auth/authenticate")
  Future<AuthResponse> login(@Body() LoginRequest request);
}
/*flutter pub run build_runner build --delete-conflicting-outputs*/
/*flutter pub run build_runner watch --delete-conflicting-outputs*/
