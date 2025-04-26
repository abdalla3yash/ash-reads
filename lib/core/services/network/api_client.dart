import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String _baseURL = "https://gutendex.com/";

const String _contentType = "Content-Type";
const String _accept = "accept";
const String _applicationJson = "application/json";

class ApiClient {
  final Dio _dio;
  final Interceptor _prettyDioLogger;

  ApiClient(this._dio, this._prettyDioLogger) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: _baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(minutes: 3),
      receiveTimeout: const Duration(minutes: 3),
      sendTimeout: const Duration(minutes: 3),
      headers: {
        _contentType: _applicationJson,
        _accept: _applicationJson,
      },
    );

    _dio.options = baseOptions;
    if (kDebugMode) _dio.interceptors.add(_prettyDioLogger);
  }

  Future<Response> get({required String url, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(
      url,
      queryParameters: queryParameters,
    );
  }

}
