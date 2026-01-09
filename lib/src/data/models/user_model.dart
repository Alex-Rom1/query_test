import 'base_model.dart';

class UserModel extends BaseModel {
  final DateTime created;
  final String name;
  final String id;

  UserModel({required this.created, required this.name, required this.id});

  UserModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: DateTime.parse(json['created']),
        name: json['name'],
        id: json['id'],
      );

  @override
  Map<String, dynamic> toJSON() => {
    'created': created.toIso8601String(),
    'name': name,
    'id': id,
  };
}
