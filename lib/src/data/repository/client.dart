import 'package:querylib_test4/querylib_test4.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Dio _dio;

  Client({required Dio dio}) : _dio = dio;

  AuthModel? _lastAuth;

  String get _usersUrl => '/collections/users';

  String get _notesUrl => '/collections/notes';

  @override
  AuthModel? get lastAuth => _lastAuth;

  Options get _options => Options(
    headers: {if (_lastAuth != null) 'Authorization': _lastAuth!.token},
  );
}
