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
  late NoteModel note;
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

    test('get user', () async {
      await _useCase.getUser(
        id: _useCase.lastAuth!.record.id,
        onResponse: (obj) => onResponse(obj, UserModel),
        onError: onError,
      );
    });

    test('create note', () async {
      await _useCase.createNote(
        userId: _useCase.lastAuth!.record.id,
        name: 'example note',
        text: 'example text',
        onResponse: (obj) {
          onResponse(obj, NoteModel);
          note = obj;
        },
        onError: onError,
      );
    });

    test('get note', () async {
      await _useCase.getNote(
        id: note.id,
        onResponse: (obj) => onResponse(obj, NoteModel),
        onError: onError,
      );
    });

    test('get note list', () async {
      await _useCase.getNoteList(
        onResponse: (obj) => onResponse(obj, List<NoteModel>),
        onError: onError,
      );
    });

    test('update note', () async {
      await _useCase.updateNote(
        noteId: note.id,
        userId: _useCase.lastAuth!.record.id,
        name: note.name,
        text: 'changed text',
        onResponse: (obj) {
          onResponse(obj, NoteModel);
          if (obj.runtimeType == NoteModel) {
            assert (obj.text == 'changed text');
          }
        },
        onError: onError,
      );
    });

    test('logout', () async {
      await _useCase.logout(
        onResponse: (_) {
          assert(_useCase.lastAuth == null);
        },
        onError: onError,
      );
    });
  });
}
