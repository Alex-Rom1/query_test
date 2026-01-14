import 'package:flutter_test/flutter_test.dart';
import 'package:querylib_test3/querylib_test3.dart';

Map<String, String> credentials = {
  'email': '${DateTime.now().microsecondsSinceEpoch}@gmail.com',
  'password': '12345678',
};

QueryUseCase useCase = QueryUseCase();

void onError(String error) {
  fail(error);
}

void onResponse(object, Type testType) {
  assert(object.runtimeType == testType);
}

void main() {
  group('query', () {
    test('signup', () {
      useCase.signup(
        onError: onError,
        email: credentials['email']!,
        password: credentials['password']!,
        passwordConfirm: credentials['password']!,
        onResponse: (object) => onResponse(object, UserModel),
      );
    });

    test('login', () {
      useCase.login(
        onResponse: (object) => onResponse(object, AuthModel),
        onError: onError,
        identity: credentials['email']!,
        password: credentials['password']!,
      );
    });

    test('getItemByID', () {
      useCase.getItemByID(
        onResponse: (object) => onResponse(object, ItemModel),
        onError: onError,
        id: 'fzplv6paebufyto',
      );
    });

    test('logout', () {
      useCase.logout(onError: onError, onResponse: (object){
        assert (useCase.lastAuth == null);
      });
    });
  });
}
