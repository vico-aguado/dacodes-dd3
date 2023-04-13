import 'dart:convert';
import 'package:equatable/equatable.dart';

class Thumbnail extends Equatable {
  final String path;
  final String extension;

  const Thumbnail({
    required this.path,
    required this.extension,
  });

  Thumbnail copyWith({
    String? path,
    String? extension,
  }) {
    return Thumbnail(
      path: path ?? this.path,
      extension: extension ?? this.extension,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'path': path,
      'extension': extension,
    };
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      path: map['path'] as String,
      extension: map['extension'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) =>
      Thumbnail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        path,
        extension,
      ];
}
