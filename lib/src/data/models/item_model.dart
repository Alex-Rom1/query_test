import 'package:querylib_test2/querylib_test2.dart';

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

  @override
  Map<String, dynamic> toJSON() => {
    'created': created,
    'description': description,
    'id': id,
    'price': price,
    'title': title,
  };

  ItemModel.fromJSON(Map<String, dynamic> json)
    : this(
        created: json['created'],
        description: json['description'],
        id: json['id'],
        price: json['price'],
        title: json['title'],
      );
}
