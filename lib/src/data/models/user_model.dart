import 'package:querylib_test4/querylib_test4.dart';

class UserModel extends BaseModel {
  final DateTime created;
  final String email;
  final String id;

  UserModel({required this.created, required this.email, required this.id});

  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: DateTime.parse(json['created']),
        email: json['email'],
        id: json['id'],
      );

  @override
  Map<String, dynamic> toJSON() => {
    'created': created.toIso8601String(),
    'email': email,
    'id': id,
  };
}
