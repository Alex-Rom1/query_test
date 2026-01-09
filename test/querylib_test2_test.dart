import 'package:flutter_test/flutter_test.dart';
import 'package:querylib_test2/querylib_test2.dart';

QueryUseCase useCase = QueryUseCase();

Map<String, String> credentials = {
  'email': '${DateTime.now().microsecondsSinceEpoch}@gmail.com',
  'password': '12345678qwerty',
};

void onResponse(dynamic object, Type testType) {
  assert(object.runtimeType == testType);
}

void onError(String error) {
  fail(error);
}

void main() {
  group('Requests', () {
    test('signup', () async {
      await useCase.signup(
        email: credentials['email']!,
        password: credentials['password']!,
        passwordConfirm: credentials['password']!,
        onResponse: (object) => onResponse(object, UserModel),
        onError: onError,
      );
    });

    test('login', () async {
      await useCase.login(
        identity: credentials['email']!,
        password: credentials['password']!,
        onResponse: (object) => onResponse(object, AuthModel),
        onError: onError,
      );
    });

    test('get item by id', () async {
      await useCase.getItemByID(
        id: 'fzplv6paebufyto',
        onResponse: (object) => onResponse(object, ItemModel),
        onError: onError,
      );
    });

    test('logout', () async {
      await useCase.logout(
        onResponse: (object) {
          assert(useCase.lastAuth == null);
        },
        onError: onError,
      );
    });
  });
}
