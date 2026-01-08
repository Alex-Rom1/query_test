import 'package:flutter_test/flutter_test.dart';
import 'package:querylib_test/querylib_test.dart';

QueryUseCase useCase = QueryUseCase();

Map<String, String> credentials = {
  'email': '${DateTime.now().microsecondsSinceEpoch}@gmail.com',
  'password': '12345678qwerty',
};

void onResponse(dynamic object, Type testType) {
  assert(object.runtimeType == testType);
}

void onError(String err) {
  fail(err);
}

void main() {
  group('Requests', () {
    test('signup test', () async {
      await useCase.signup(
        email: credentials['email']!,
        password: credentials['password']!,
        passwordConfirm: credentials['password']!,
        onResponse: (object) => onResponse(object, UserModel),
        onError: onError,
      );
    });

    test('login test', () async {
      await useCase.login(
        identity: credentials['email']!,
        password: credentials['password']!,
        onResponse: (object) => onResponse(object, AuthModel),
        onError: onError,
      );
    });

    test('getElemById test', () async {
      await useCase.getItemByID(
        id: 'laizhwkyqlndrm1',
        onResponse: (object) => onResponse(object, ItemModel),
        onError: onError,
      );
    });

    test('logout test', () async {
      await useCase.logout(
        onResponse: (object) {
          assert(useCase.lastAuth == null);
        },
        onError: onError,
      );
    });
  });
}
