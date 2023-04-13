import 'dart:convert';
import 'package:equatable/equatable.dart';

class TextObject extends Equatable {
  final String type;
  final String language;
  final String text;

  const TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  @override
  List<Object> get props => [type, language, text];

  TextObject copyWith({
    String? type,
    String? language,
    String? text,
  }) {
    return TextObject(
      type: type ?? this.type,
      language: language ?? this.language,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'language': language,
      'text': text,
    };
  }

  factory TextObject.fromMap(Map<String, dynamic> map) {
    return TextObject(
      type: map['type'] as String,
      language: map['language'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextObject.fromJson(String source) =>
      TextObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
