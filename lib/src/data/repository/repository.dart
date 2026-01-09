import 'package:querylib_test2/querylib_test2.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<AuthModel> login({required String identity, required String password});

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<ItemModel> getElementByID({required String id});

  Future<void> logout();
}
