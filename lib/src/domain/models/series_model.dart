import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/category_item_model.dart';
import 'package:dacodes_dd3/src/domain/models/category_model.dart';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:dacodes_dd3/src/domain/models/thumbnail_model.dart';
import 'package:dacodes_dd3/src/domain/models/url_model.dart';
import 'package:equatable/equatable.dart';

class Serie extends Mappable with EquatableMixin {
  final int id;
  final String title;
  final String description;
  final String resourceUri;
  final List<Url> urls;
  final int startYear;
  final int endYear;
  final String rating;
  final String type;
  final String modified;
  final Thumbnail thumbnail;
  final Category creators;
  final Category characters;
  final Category stories;
  final Category comics;
  final Category events;
  final CategoryItem? next;
  final CategoryItem? previous;

  Serie({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
    this.next,
    this.previous,
  });

  Serie copyWith({
    int? id,
    String? title,
    String? description,
    String? resourceUri,
    List<Url>? urls,
    int? startYear,
    int? endYear,
    String? rating,
    String? type,
    String? modified,
    Thumbnail? thumbnail,
    Category? creators,
    Category? characters,
    Category? stories,
    Category? comics,
    Category? events,
    CategoryItem? next,
    CategoryItem? previous,
  }) {
    return Serie(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      resourceUri: resourceUri ?? this.resourceUri,
      urls: urls ?? this.urls,
      startYear: startYear ?? this.startYear,
      endYear: endYear ?? this.endYear,
      rating: rating ?? this.rating,
      type: type ?? this.type,
      modified: modified ?? this.modified,
      thumbnail: thumbnail ?? this.thumbnail,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      stories: stories ?? this.stories,
      comics: comics ?? this.comics,
      events: events ?? this.events,
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
      'startYear': startYear,
      'endYear': endYear,
      'rating': rating,
      'type': type,
      'modified': modified,
      'thumbnail': thumbnail.toMap(),
      'creators': creators.toMap(),
      'characters': characters.toMap(),
      'stories': stories.toMap(),
      'comics': comics.toMap(),
      'events': events.toMap(),
      'next': next?.toMap(),
      'previous': previous?.toMap(),
    };
  }

  factory Serie.fromMap(Map<String, dynamic> map) {
    return Serie(
      id: map['id'] as int,
      title: map['title'] as String,
      description: (map['description'] ?? '') as String,
      resourceUri: map['resourceURI'] as String,
      urls: List<Url>.from(
        (map['urls'] as List<dynamic>).map<Url>(
          (x) => Url.fromMap(x as Map<String, dynamic>),
        ),
      ),
      startYear: map['startYear'] as int,
      endYear: map['endYear'] as int,
      rating: map['rating'] as String,
      type: map['type'] as String,
      modified: map['modified'] as String,
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      creators: Category.fromMap(map['creators'] as Map<String, dynamic>),
      characters: Category.fromMap(map['characters'] as Map<String, dynamic>),
      stories: Category.fromMap(map['stories'] as Map<String, dynamic>),
      comics: Category.fromMap(map['comics'] as Map<String, dynamic>),
      events: Category.fromMap(map['events'] as Map<String, dynamic>),
      next: map['next'] != null
          ? CategoryItem.fromMap(map['next'] as Map<String, dynamic>)
          : null,
      previous: map['previous'] != null
          ? CategoryItem.fromMap(map['previous'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Serie.fromJson(String source) =>
      Serie.fromMap(json.decode(source) as Map<String, dynamic>);

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
      startYear,
      endYear,
      rating,
      type,
      modified,
      thumbnail,
      creators,
      characters,
      stories,
      comics,
      events,
      next,
      previous,
    ];
  }
}
