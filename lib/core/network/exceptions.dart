class HttpException {
  final dynamic? response;
  final String? errorMsg;
  final int? errorCode;

  HttpException.serverException(this.response, this.errorMsg, {this.errorCode});
}