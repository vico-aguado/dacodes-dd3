import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/category_item_model.dart';
import 'package:dacodes_dd3/src/domain/models/category_model.dart';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:dacodes_dd3/src/domain/models/thumbnail_model.dart';
import 'package:equatable/equatable.dart';

class Story extends Mappable with EquatableMixin {
  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final String type;
  final String modified;
  final Thumbnail? thumbnail;
  final Category creators;
  final Category characters;
  final Category series;
  final Category comics;
  final Category events;
  final CategoryItem? originalIssue;

  Story({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.type,
    required this.modified,
    this.thumbnail,
    required this.creators,
    required this.characters,
    required this.series,
    required this.comics,
    required this.events,
    this.originalIssue,
  });

  Story copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceUri,
    String? type,
    String? modified,
    Thumbnail? thumbnail,
    Category? creators,
    Category? characters,
    Category? series,
    Category? comics,
    Category? events,
    CategoryItem? originalIssue,
  }) {
    return Story(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceUri: resourceUri ?? this.resourceUri,
      type: type ?? this.type,
      modified: modified ?? this.modified,
      thumbnail: thumbnail ?? this.thumbnail,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      series: series ?? this.series,
      comics: comics ?? this.comics,
      events: events ?? this.events,
      originalIssue: originalIssue ?? this.originalIssue,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'resourceUri': resourceUri,
      'type': type,
      'modified': modified,
      'thumbnail': thumbnail?.toMap(),
      'creators': creators.toMap(),
      'characters': characters.toMap(),
      'series': series.toMap(),
      'comics': comics.toMap(),
      'events': events.toMap(),
      'originalIssue': originalIssue?.toMap(),
    };
  }

  factory Story.fromMap(Map<String, dynamic> map) {
    return Story(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      resourceUri: map['resourceURI'] as String,
      type: map['type'] as String,
      modified: map['modified'] as String,
      thumbnail: map['thumbnail'] != null
          ? Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>)
          : null,
      creators: Category.fromMap(map['creators'] as Map<String, dynamic>),
      characters: Category.fromMap(map['characters'] as Map<String, dynamic>),
      series: Category.fromMap(map['series'] as Map<String, dynamic>),
      comics: Category.fromMap(map['comics'] as Map<String, dynamic>),
      events: Category.fromMap(map['events'] as Map<String, dynamic>),
      originalIssue: map['originalIssue'] != null
          ? CategoryItem.fromMap(map['originalIssue'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Story.fromJson(String source) =>
      Story.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      resourceUri,
      type,
      modified,
      thumbnail,
      creators,
      characters,
      series,
      comics,
      events,
      originalIssue,
    ];
  }
}
