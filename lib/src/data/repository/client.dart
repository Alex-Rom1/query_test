import 'package:querylib_test2/querylib_test2.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Dio _dio;
  final Storage _storage;
  AuthModel? _lastAuth;

  Client({required Dio dio, required Storage storage})
    : _dio = dio,
      _storage = storage;

  Options get _options => Options(
    headers: {if (lastAuth != null) 'Authorization': _lastAuth!.token},
  );

  @override
  AuthModel? get lastAuth => _lastAuth;

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    final response = await _dio.post(
      '${_storage.apiURL}/collections/users/auth-with-password',
      data: {'identity': identity, 'password': password},
    );
    _lastAuth = AuthModel.fromJSON(response.data);
    return _lastAuth!;
  }

  @override
  Future<void> logout() async {
    _lastAuth = null;
  }

  @override
  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  }) async {
    final response = await _dio.post(
      '${_storage.apiURL}/collections/users/records',
      data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      },
    );
    return UserModel.fromJSON(response.data);
  }

  @override
  Future<ItemModel> getElementByID({required String id}) async {
    final response = await _dio.get(
      '${_storage.apiURL}/collections/items/records/$id',
      options: _options,
    );
    return ItemModel.fromJSON(response.data);
  }
}
