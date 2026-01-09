import 'package:querylib_test/querylib_test.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<AuthModel> login({required String identity, required String password});

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<void> logout();

  Future<ItemModel> getItemByID({required String id});
}
