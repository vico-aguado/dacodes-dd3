import 'dart:convert';
import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final String type;
  final double price;

  const Price({
    required this.type,
    required this.price,
  });

  Price copyWith({
    String? type,
    double? price,
  }) {
    return Price(
      type: type ?? this.type,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'price': price,
    };
  }

  factory Price.fromMap(Map<String, dynamic> map) {
    return Price(
      type: map['type'] as String,
      price: double.parse(map['price'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory Price.fromJson(String source) =>
      Price.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        type,
        price,
      ];
}
