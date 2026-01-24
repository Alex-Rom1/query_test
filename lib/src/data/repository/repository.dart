import 'package:querylib_test4/querylib_test4.dart';

abstract interface class Repository {
  AuthModel? get lastAuth;

  Future<UserModel> signup({
    required String email,
    required String password,
    required String passwordConfirm,
  });

  Future<AuthModel> login({required String identity, required String password});

  Future<UserModel> getUser({required String id});

  Future<NoteModel> createNote({
    required String userId,
    required String name,
    required String text,
  });

  Future<NoteModel> getNote({required String id});

  Future<List<NoteModel>> getNoteList();

  Future<void> logout();
}
