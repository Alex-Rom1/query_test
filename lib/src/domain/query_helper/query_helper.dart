import 'package:dio/dio.dart';

class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required Function(T) onResponse,
    required Function(String) onError,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    if (e is DioException) {
      if (e.response != null) {
        try {
          return '${e.response!.data['message']} Status Code: ${e.response!.data['status']}';
        } on Exception {
          return e.toString();
        }
      }
    }
    return e.toString();
  }
}
