// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart' hide Headers;
import 'package:get/get.dart';

class ServerError implements Exception {
  int? _errorCode;
  String _errorMessage = "";

  ServerError.withError({required DioError error}) {
    _handleError(error);
  }

  int? getErrorCode() => _errorCode;

  String getErrorMessage() => _errorMessage;

  _handleError(DioError error) {
    _errorCode = error.response?.statusCode ?? 500;
    if ((_errorCode ?? 500) >= 200 && (_errorCode ?? 500) <= 299) {
      try {
        if (error.response?.data['Error'] is Map<String, dynamic>) {
          _errorMessage = error.response!.data['Error']['message'].toString();
        } else {
          _errorMessage = error.response!.data['message'].toString();
        }
      } catch (e) {
        _errorMessage = 'something_wrong'.tr;
      }
    } else if ((_errorCode ?? 500) >= 500 && (_errorCode ?? 500) <= 599) {
      _errorMessage = "server_error";
    } else if ((_errorCode ?? 500) == 401) {
      _errorMessage = "bad_request".tr;
    } else if ((_errorCode ?? 500) == 401) {
      _errorMessage = "unauthorized".tr;
    } else if ((_errorCode ?? 500) == 403) {
      _errorMessage = "forbidden".tr;
    } else if ((_errorCode ?? 500) == 404) {
      _errorMessage = "not_found".tr;
    } else if ((_errorCode ?? 500) == 404) {
      _errorMessage = "connection_timeout".tr;
    } else {
      _errorMessage = 'something_wrong'.tr;
    }
    return _errorMessage;
  }
}
