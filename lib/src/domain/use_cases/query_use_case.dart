import 'package:dio/dio.dart';
import 'package:querylib_test/querylib_test.dart';

class QueryUseCase {
  final _helper = QueryHelper();
  final _client = Client(dio: Dio(), storage: Storage());

  AuthModel? get lastAuth => _client.lastAuth;

  Future<void> getItemByID({
    required String id,
    required void Function(ItemModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.getItemByID(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> login({
    required String identity,
    required String password,
    required void Function(AuthModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> logout({
    required void Function(void) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.logout(),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> signup({
    required String email,
    required String password,
    required String passwordConfirm,
    required void Function(UserModel) onResponse,
    required void Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.signup(
        email: email,
        password: password,
        passwordConfirm: passwordConfirm,
      ),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
