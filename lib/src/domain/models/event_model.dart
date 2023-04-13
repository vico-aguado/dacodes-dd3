import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/category_item_model.dart';
import 'package:dacodes_dd3/src/domain/models/category_model.dart';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:dacodes_dd3/src/domain/models/thumbnail_model.dart';
import 'package:dacodes_dd3/src/domain/models/url_model.dart';
import 'package:equatable/equatable.dart';

class Event extends Mappable with EquatableMixin {
  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final List<Url> urls;
  final String modified;
  final DateTime start;
  final DateTime end;
  final Thumbnail thumbnail;
  final Category creators;
  final Category characters;
  final Category stories;
  final Category comics;
  final Category series;
  final CategoryItem? next;
  final CategoryItem? previous;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.modified,
    required this.start,
    required this.end,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.series,
    this.next,
    this.previous,
  });

  Event copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceUri,
    List<Url>? urls,
    String? modified,
    DateTime? start,
    DateTime? end,
    Thumbnail? thumbnail,
    Category? creators,
    Category? characters,
    Category? stories,
    Category? comics,
    Category? series,
    CategoryItem? next,
    CategoryItem? previous,
  }) {
    return Event(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceUri: resourceUri ?? this.resourceUri,
      urls: urls ?? this.urls,
      modified: modified ?? this.modified,
      start: start ?? this.start,
      end: end ?? this.end,
      thumbnail: thumbnail ?? this.thumbnail,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      stories: stories ?? this.stories,
      comics: comics ?? this.comics,
      series: series ?? this.series,
      next: next ?? this.next,
      previous: previous ?? this.previous,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'resourceUri': resourceUri,
      'urls': urls.map((x) => x.toMap()).toList(),
      'modified': modified,
      'start': start.millisecondsSinceEpoch,
      'end': end.millisecondsSinceEpoch,
      'thumbnail': thumbnail.toMap(),
      'creators': creators.toMap(),
      'characters': characters.toMap(),
      'stories': stories.toMap(),
      'comics': comics.toMap(),
      'series': series.toMap(),
      'next': next?.toMap(),
      'previous': previous?.toMap(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as int,
      title: map['title'] as String,
      description: (map['description'] ?? '') as String,
      resourceUri: map['resourceURI'] as String,
      urls: List<Url>.from(
        (map['urls'] as List<dynamic>).map<Url>(
          (x) => Url.fromMap(x as Map<String, dynamic>),
        ),
      ),
      modified: map['modified'] as String,
      start: DateTime.parse(map['start'] as String),
      end: DateTime.parse(map['end'] as String),
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      creators: Category.fromMap(map['creators'] as Map<String, dynamic>),
      characters: Category.fromMap(map['characters'] as Map<String, dynamic>),
      stories: Category.fromMap(map['stories'] as Map<String, dynamic>),
      comics: Category.fromMap(map['comics'] as Map<String, dynamic>),
      series: Category.fromMap(map['series'] as Map<String, dynamic>),
      next: map['next'] != null
          ? CategoryItem.fromMap(map['next'] as Map<String, dynamic>)
          : null,
      previous: map['previous'] != null
          ? CategoryItem.fromMap(map['previous'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      resourceUri,
      urls,
      modified,
      start,
      end,
      thumbnail,
      creators,
      characters,
      stories,
      comics,
      series,
      next,
      previous,
    ];
  }
}
