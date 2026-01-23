import 'package:dio/dio.dart';

class QueryHelper {
  Future<void> request<T>({
    required Future<T> Function() request,
    required void Function(T) onResponse,
    required void Function(String) onError,
  }) async {
    try {
      T response = await request();
      onResponse(response);
    } on Exception catch (e) {
      onError(castError(e));
    }
  }

  String castError(Exception e) {
    if (e is! DioException) {
      return e.toString();
    }

    if (e.response == null) {
      return e.toString();
    }

    try {
      return '${e.response!.data['message']} (HTTP ${e.response!.statusCode})\n${e.response!.data}';
    } on Exception {
      return 'HTTP ${e.response!.statusCode}\n${e.response!.data}';
    }
  }
}
