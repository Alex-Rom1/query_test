import 'package:querylib_test4/querylib_test4.dart';

class NoteModel extends BaseModel {
  final DateTime created;
  final String id;
  final String name;
  final String text;
  final DateTime updated;
  final String userId;

  NoteModel({
    required this.created,
    required this.id,
    required this.name,
    required this.text,
    required this.updated,
    required this.userId,
  });

  NoteModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: DateTime.parse(json['created']),
        id: json['id'],
        name: json['name'],
        text: json['text'],
        updated: DateTime.parse(json['updated']),
        userId: json['userId'],
      );

  static List<NoteModel> fromJSONList(List list) =>
      list.map((element) => NoteModel.fromJSON(element)).toList();

  @override
  Map<String, dynamic> toJSON() => {
    'created': created.toIso8601String(),
    'id': id,
    'name': name,
    'text': text,
    'updated': updated.toIso8601String(),
    'userId': userId,
  };
}
