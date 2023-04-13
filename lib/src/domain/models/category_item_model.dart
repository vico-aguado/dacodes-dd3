import 'dart:convert';
import 'package:equatable/equatable.dart';

class CategoryItem extends Equatable {
  final String resourceUri;
  final String name;
  final String type;
  final String role;

  const CategoryItem({
    required this.resourceUri,
    required this.name,
    required this.type,
    required this.role,
  });

  CategoryItem copyWith({
    String? resourceUri,
    String? name,
    String? type,
    String? role,
  }) {
    return CategoryItem(
      resourceUri: resourceUri ?? this.resourceUri,
      name: name ?? this.name,
      type: type ?? this.type,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'resourceUri': resourceUri,
      'name': name,
      'type': type,
      'role': role,
    };
  }

  factory CategoryItem.fromMap(Map<String, dynamic> map) {
    return CategoryItem(
      resourceUri: map['resourceURI'] as String,
      name: map['name'] as String,
      type: (map['type'] ?? '') as String,
      role: (map['role'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryItem.fromJson(String source) =>
      CategoryItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        resourceUri,
        name,
        type,
        role,
      ];
}
