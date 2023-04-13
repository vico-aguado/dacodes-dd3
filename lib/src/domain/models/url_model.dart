import 'dart:convert';
import 'package:equatable/equatable.dart';

class Url extends Equatable {
  final String type;
  final String url;
  const Url({
    required this.type,
    required this.url,
  });

  Url copyWith({
    String? type,
    String? url,
  }) {
    return Url(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'url': url,
    };
  }

  factory Url.fromMap(Map<String, dynamic> map) {
    return Url(
      type: map['type'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Url.fromJson(String source) =>
      Url.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        type,
        url,
      ];
}
