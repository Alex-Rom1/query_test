import 'package:querylib_test3/querylib_test3.dart';

class ItemModel extends BaseModel {
  final DateTime created;
  final String description;
  final String id;
  final int price;
  final String title;

  ItemModel({
    required this.created,
    required this.description,
    required this.id,
    required this.price,
    required this.title,
  });

  ItemModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: DateTime.parse(json['created']),
        description: json['description'],
        id: json['id'],
        price: json['price'],
        title: json['title'],
      );

  @override
  Map<String, dynamic> toJSON() => {
    'created': created.toIso8601String(),
    'description': description,
    'id': id,
    'price': price,
    'title': title,
  };
}
