import 'package:logger/logger.dart';

import 'http_response.dart';

abstract class INetworkClient {
  void addLoggingInterceptor(Logger logger);

  Future<HttpResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});
}