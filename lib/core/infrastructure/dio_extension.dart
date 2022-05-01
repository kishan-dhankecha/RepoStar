import 'dart:io' show SocketException;

import 'package:dio/dio.dart' show DioError, DioErrorType;

extension CustomDioError on DioError {
  bool get isNoConnectionError {
    return type == DioErrorType.other && error is SocketException;
  }
}
