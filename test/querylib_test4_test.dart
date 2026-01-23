import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:querylib_test4/querylib_test4.dart';

final _useCase = QueryUseCase(
  dio: Dio(.new(baseUrl: 'http://127.0.0.1:8090/api')),
);

final email = '${DateTime.now().microsecondsSinceEpoch}@ya.ru';
final password = r'Pa$$w0rd';

void onResponse(dynamic obj, Type expectedType) {
  stdout.writeln(obj.toString());
  assert(obj.runtimeType == expectedType);
}

void onError(String e) => fail(e);

void main() {
  group('test query', () {
    test('signup', () async {
      await _useCase.signup(
        email: email,
        password: password,
        passwordConfirm: password,
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
      );
    });

    test('login', () async {
      await _useCase.login(
        identity: email,
        password: password,
        onResponse: (obj) => onResponse(obj, AuthModel),
        onError: onError,
      );
    });
  });
}
