import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/category_model.dart';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:dacodes_dd3/src/domain/models/thumbnail_model.dart';
import 'package:dacodes_dd3/src/domain/models/url_model.dart';
import 'package:equatable/equatable.dart';

class Character extends Mappable with EquatableMixin {
  final int id;
  final String name;
  final String description;
  final String modified;
  final Thumbnail thumbnail;
  final String resourceUri;
  final Category comics;
  final Category series;
  final Category stories;
  final Category events;
  final List<Url> urls;

  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  Character copyWith({
    int? id,
    String? name,
    String? description,
    String? modified,
    Thumbnail? thumbnail,
    String? resourceUri,
    Category? comics,
    Category? series,
    Category? stories,
    Category? events,
    List<Url>? urls,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      modified: modified ?? this.modified,
      thumbnail: thumbnail ?? this.thumbnail,
      resourceUri: resourceUri ?? this.resourceUri,
      comics: comics ?? this.comics,
      series: series ?? this.series,
      stories: stories ?? this.stories,
      events: events ?? this.events,
      urls: urls ?? this.urls,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'modified': modified,
      'thumbnail': thumbnail.toMap(),
      'resourceURI': resourceUri,
      'comics': comics.toMap(),
      'series': series.toMap(),
      'stories': stories.toMap(),
      'events': events.toMap(),
      'urls': urls.map((x) => x.toMap()).toList(),
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      modified: map['modified'] as String,
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      resourceUri: map['resourceURI'] as String,
      comics: Category.fromMap(map['comics'] as Map<String, dynamic>),
      series: Category.fromMap(map['series'] as Map<String, dynamic>),
      stories: Category.fromMap(map['stories'] as Map<String, dynamic>),
      events: Category.fromMap(map['events'] as Map<String, dynamic>),
      urls: List<Url>.from(
        (map['urls'] as List<dynamic>).map<Url>(
          (x) => Url.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Character.fromJson(String source) =>
      Character.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      name,
      description,
      modified,
      thumbnail,
      resourceUri,
      comics,
      series,
      stories,
      events,
      urls,
    ];
  }
}
