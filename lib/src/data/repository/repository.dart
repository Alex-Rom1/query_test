import 'package:querylib_test3/querylib_test3.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<AuthModel> login({required String identity, required String password});

  Future<ItemModel> getItemByID({required String id});

  Future<void> logout();
}
