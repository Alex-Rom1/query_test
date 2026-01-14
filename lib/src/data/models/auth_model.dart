import 'package:querylib_test3/querylib_test3.dart';

class AuthModel extends BaseModel {
  final UserModel record;
  final String token;

  AuthModel({required this.record, required this.token});

  AuthModel.fromJSON(Map<String, dynamic> json)
    : this(record: UserModel.fromJSON(json['record']), token: json['token']);

  @override
  Map<String, dynamic> toJSON() => {'record': record.toJSON(), 'token': token};
}
