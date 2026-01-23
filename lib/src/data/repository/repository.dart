import 'package:querylib_test4/querylib_test4.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<AuthModel> login({
  required String identity,
  required String password,
  });
}
