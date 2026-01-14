import 'package:querylib_test3/querylib_test3.dart';
import 'package:dio/dio.dart';

class Client implements Repository {
  final Storage _storage;
  final Dio _dio;
  AuthModel? _lastAuth;

  Client({required Storage storage, required Dio dio})
    : _storage = storage,
      _dio = dio;

  Options get _options => Options(
    headers: {if (_lastAuth != null) 'Authorization': _lastAuth!.token},
  );

  @override
  AuthModel? get lastAuth => _lastAuth;

  @override
  Future<ItemModel> getItemByID({required String id}) async {
    var response = await _dio.get(
      '${_storage.apiUrl}/collections/items/records/$id',
      options: _options,
    );
    return ItemModel.fromJSON(response.data);
  }

  @override
  Future<AuthModel> login({
    required String identity,
    required String password,
  }) async {
    var response = await _dio.post(
      '${_storage.apiUrl}/collections/users/auth-with-password',
      data: {
        'identity': identity,
        'password': password,
      },
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
    var response = await _dio.post(
      '${_storage.apiUrl}/collections/users/records',
      data: {
        'email': email,
        'password': password,
        'passwordConfirm': passwordConfirm,
      },
    );
    return UserModel.fromJSON(response.data);
  }
}
