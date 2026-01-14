import 'package:dio/dio.dart';
import 'package:querylib_test3/querylib_test3.dart';

class QueryUseCase {
  final Client _client = Client(storage: Storage(), dio: Dio());
  final QueryHelper _helper = QueryHelper();

  Future<void> signup({
    required Function(UserModel) onResponse,
    required Function(String) onError,
    required String email,
    required String password,
    required String passwordConfirm,
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

  Future<void> login({
    required Function(AuthModel) onResponse,
    required Function(String) onError,
    required String identity,
    required String password,
  }) async {
    await _helper.request(
      request: () => _client.login(identity: identity, password: password),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> getItemByID({
    required Function(ItemModel) onResponse,
    required Function(String) onError,
    required String id,
  }) async {
    await _helper.request(
      request: () => _client.getItemByID(id: id),
      onResponse: onResponse,
      onError: onError,
    );
  }

  Future<void> logout({
    required Function(void) onResponse,
    required Function(String) onError,
  }) async {
    await _helper.request(
      request: () => _client.logout(),
      onResponse: onResponse,
      onError: onError,
    );
  }
}
