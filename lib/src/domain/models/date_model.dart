import 'dart:convert';
import 'package:equatable/equatable.dart';

class Date extends Equatable {
  final String type;
  final String date;

  const Date({
    required this.type,
    required this.date,
  });

  Date copyWith({
    String? type,
    String? date,
  }) {
    return Date(
      type: type ?? this.type,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'date': date,
    };
  }

  factory Date.fromMap(Map<String, dynamic> map) {
    return Date(
      type: map['type'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Date.fromJson(String source) =>
      Date.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        type,
        date,
      ];
}
