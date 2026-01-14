import 'package:querylib_test3/querylib_test3.dart';

class UserModel extends BaseModel {
  final DateTime created;
  final String id;
  final String name;

  UserModel({required this.created, required this.id, required this.name});

  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: DateTime.parse(json['created']),
        id: json['id'],
        name: json['name'],
      );

  @override
  Map<String, dynamic> toJSON() => {
    'created': created.toIso8601String(),
    'id': id,
    'name': name,
  };
}
