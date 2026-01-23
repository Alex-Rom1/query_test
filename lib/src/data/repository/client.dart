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

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    var response = await _dio.post(
      '$_usersUrl/records',
      data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
        'emailVisibility': true,
      },
    );
    return .fromJSON(response.data);
  }

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    var response = await _dio.post(
      '$_usersUrl/auth-with-password',
      data: {'identity': identity, 'password': password},
    );
    _lastAuth = .fromJSON(response.data);
    return _lastAuth!;
  }
}
