import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/src/logger.dart';
import 'package:meal_generator/core/network/exceptions.dart';
import 'package:meal_generator/core/network/http_response.dart';
import 'package:meal_generator/core/network/i_network_client.dart';

class DioNetworkClient implements INetworkClient {
  late Dio _dio;

  DioNetworkClient({required BaseOptions options}) {
    _dio = Dio(options);
  }

  @override
  void addLoggingInterceptor(Logger logger) {
    // TODO: implement addLoggingInterceptor
  }

  @override
  Future<HttpResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio
        .get<T>(path, queryParameters: queryParameters)
        .then((Response<T> res) {
      _throwIfNoSuccess(res);
      var response = HttpResponse<T>(
          data: res.data!,
          headers: res.headers.map,
          statusCode: res.statusCode ?? 0,
          statusMessage: res.statusMessage ?? '');
      return response;
    });
  }

  void _throwIfNoSuccess(Response res) {
    if (res.data == null) {
      throw HttpException.serverException(res, res.statusMessage ?? '');
    }
    if (res.statusCode != null &&
        (res.statusCode! < 200 || res.statusCode! > 299)) {
      var response = HttpResponse<dynamic>(
          data: res.data,
          headers: res.headers.map,
          statusCode: res.statusCode,
          statusMessage: res.statusMessage);
      throw HttpException.serverException(response, res.statusMessage ?? '');
    }
  }
}
