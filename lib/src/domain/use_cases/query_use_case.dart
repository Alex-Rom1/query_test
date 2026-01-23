import 'package:dio/dio.dart';
import 'package:querylib_test4/querylib_test4.dart';

class QueryUseCase {
  final QueryHelper _helper = QueryHelper();
  final Client _client;

  QueryUseCase({required Dio dio}) : _client = Client(dio: dio);

  AuthModel? get lastAuth => _client.lastAuth;
}