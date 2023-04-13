import 'dart:convert';

import 'package:dacodes_dd3/src/domain/models/category_item_model.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int available;
  final String collectionUri;
  final List<CategoryItem> items;
  final int returned;

  const Category({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  Category copyWith({
    int? available,
    String? collectionUri,
    List<CategoryItem>? items,
    int? returned,
  }) {
    return Category(
      available: available ?? this.available,
      collectionUri: collectionUri ?? this.collectionUri,
      items: items ?? this.items,
      returned: returned ?? this.returned,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'available': available,
      'collectionUri': collectionUri,
      'items': items.map((x) => x.toMap()).toList(),
      'returned': returned,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      available: map['available'] as int,
      collectionUri: map['collectionURI'] as String,
      items: List<CategoryItem>.from(
        (map['items'] as List<dynamic>).map<CategoryItem>(
          (x) => CategoryItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      returned: map['returned'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        available,
        collectionUri,
        items,
        returned,
      ];
}
