import 'package:querylib_test/querylib_test.dart';

class AuthModel extends BaseModel {
  final String token;
  final UserModel record;

  AuthModel({required this.token, required this.record});

  AuthModel.fromJSON(Map<String, dynamic> json)
    : this(token: json['token'], record: UserModel.fromJSON(json['record']));

  @override
  Map<String, dynamic> toJSON() => {'record': record.toJSON(), 'token': token};
}
