import 'package:dio/dio.dart';

class ResponseWrapper<T> {
  String? error;
  T? data;

  ResponseWrapper({this.error, this.data});
}

class RequestHelper<T> {
  Future<ResponseWrapper<T>>? apiRequest(Future<T> call) async {
    T? response;

    try {
      response = await call;
    } catch (error) {
      String? errorMessage;
      if (error is DioException) {
        errorMessage = error.type.name;
      }
      errorMessage = 'Something went wrong';
      return ResponseWrapper(error: errorMessage);
    }

    return ResponseWrapper(data: response);
  }
}
