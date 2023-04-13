import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/category_item_model.dart';
import 'package:dacodes_dd3/src/domain/models/category_model.dart';
import 'package:dacodes_dd3/src/domain/models/date_model.dart';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:dacodes_dd3/src/domain/models/price_model.dart';
import 'package:dacodes_dd3/src/domain/models/text_model.dart';
import 'package:dacodes_dd3/src/domain/models/thumbnail_model.dart';
import 'package:dacodes_dd3/src/domain/models/url_model.dart';
import 'package:equatable/equatable.dart';

class Comic extends Mappable with EquatableMixin {
  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final List<TextObject> textObjects;
  final String resourceUri;
  final List<Url> urls;
  final CategoryItem series;
  final List<CategoryItem> variants;
  final List<CategoryItem> collections;
  final List<CategoryItem> collectedIssues;
  final List<Date> dates;
  final List<Price> prices;
  final Thumbnail thumbnail;
  final List<Thumbnail> images;
  final Category creators;
  final Category characters;
  final Category stories;
  final Category events;

  Comic({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  Comic copyWith({
    int? id,
    int? digitalId,
    String? title,
    int? issueNumber,
    String? variantDescription,
    String? description,
    String? modified,
    String? isbn,
    String? upc,
    String? diamondCode,
    String? ean,
    String? issn,
    String? format,
    int? pageCount,
    List<TextObject>? textObjects,
    String? resourceUri,
    List<Url>? urls,
    CategoryItem? series,
    List<CategoryItem>? variants,
    List<CategoryItem>? collections,
    List<CategoryItem>? collectedIssues,
    List<Date>? dates,
    List<Price>? prices,
    Thumbnail? thumbnail,
    List<Thumbnail>? images,
    Category? creators,
    Category? characters,
    Category? stories,
    Category? events,
  }) {
    return Comic(
      id: id ?? this.id,
      digitalId: digitalId ?? this.digitalId,
      title: title ?? this.title,
      issueNumber: issueNumber ?? this.issueNumber,
      variantDescription: variantDescription ?? this.variantDescription,
      description: description ?? this.description,
      modified: modified ?? this.modified,
      isbn: isbn ?? this.isbn,
      upc: upc ?? this.upc,
      diamondCode: diamondCode ?? this.diamondCode,
      ean: ean ?? this.ean,
      issn: issn ?? this.issn,
      format: format ?? this.format,
      pageCount: pageCount ?? this.pageCount,
      textObjects: textObjects ?? this.textObjects,
      resourceUri: resourceUri ?? this.resourceUri,
      urls: urls ?? this.urls,
      series: series ?? this.series,
      variants: variants ?? this.variants,
      collections: collections ?? this.collections,
      collectedIssues: collectedIssues ?? this.collectedIssues,
      dates: dates ?? this.dates,
      prices: prices ?? this.prices,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      creators: creators ?? this.creators,
      characters: characters ?? this.characters,
      stories: stories ?? this.stories,
      events: events ?? this.events,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'digitalId': digitalId,
      'title': title,
      'issueNumber': issueNumber,
      'variantDescription': variantDescription,
      'description': description,
      'modified': modified,
      'isbn': isbn,
      'upc': upc,
      'diamondCode': diamondCode,
      'ean': ean,
      'issn': issn,
      'format': format,
      'pageCount': pageCount,
      'textObjects': textObjects.map((x) => x.toMap()).toList(),
      'resourceUri': resourceUri,
      'urls': urls.map((x) => x.toMap()).toList(),
      'series': series.toMap(),
      'variants': variants.map((x) => x.toMap()).toList(),
      'collections': collections.map((x) => x.toMap()).toList(),
      'collectedIssues': collectedIssues.map((x) => x.toMap()).toList(),
      'dates': dates.map((x) => x.toMap()).toList(),
      'prices': prices.map((x) => x.toMap()).toList(),
      'thumbnail': thumbnail.toMap(),
      'images': images.map((x) => x.toMap()).toList(),
      'creators': creators.toMap(),
      'characters': characters.toMap(),
      'stories': stories.toMap(),
      'events': events.toMap(),
    };
  }

  factory Comic.fromMap(Map<String, dynamic> map) {
    return Comic(
      id: map['id'] as int,
      digitalId: map['digitalId'] as int,
      title: map['title'] as String,
      issueNumber: map['issueNumber'] as int,
      variantDescription: map['variantDescription'] as String,
      description: (map['description'] ?? '') as String,
      modified: map['modified'] as String,
      isbn: map['isbn'] as String,
      upc: map['upc'] as String,
      diamondCode: map['diamondCode'] as String,
      ean: map['ean'] as String,
      issn: map['issn'] as String,
      format: map['format'] as String,
      pageCount: map['pageCount'] as int,
      textObjects: List<TextObject>.from(
        (map['textObjects'] as List<dynamic>).map<TextObject>(
          (x) => TextObject.fromMap(x as Map<String, dynamic>),
        ),
      ),
      resourceUri: map['resourceURI'] as String,
      urls: List<Url>.from(
        (map['urls'] as List<dynamic>).map<Url>(
          (x) => Url.fromMap(x as Map<String, dynamic>),
        ),
      ),
      series: CategoryItem.fromMap(map['series'] as Map<String, dynamic>),
      variants: List<CategoryItem>.from(
        (map['variants'] as List<dynamic>).map<CategoryItem>(
          (x) => CategoryItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      collections: List<CategoryItem>.from(
        (map['collections'] as List<dynamic>).map<CategoryItem>(
          (x) => CategoryItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      collectedIssues: List<CategoryItem>.from(
        (map['collectedIssues'] as List<dynamic>).map<CategoryItem>(
          (x) => CategoryItem.fromMap(x as Map<String, dynamic>),
        ),
      ),
      dates: List<Date>.from(
        (map['dates'] as List<dynamic>).map<Date>(
          (x) => Date.fromMap(x as Map<String, dynamic>),
        ),
      ),
      prices: List<Price>.from(
        (map['prices'] as List<dynamic>).map<Price>(
          (x) => Price.fromMap(x as Map<String, dynamic>),
        ),
      ),
      thumbnail: Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>),
      images: List<Thumbnail>.from(
        (map['images'] as List<dynamic>).map<Thumbnail>(
          (x) => Thumbnail.fromMap(x as Map<String, dynamic>),
        ),
      ),
      creators: Category.fromMap(map['creators'] as Map<String, dynamic>),
      characters: Category.fromMap(map['characters'] as Map<String, dynamic>),
      stories: Category.fromMap(map['stories'] as Map<String, dynamic>),
      events: Category.fromMap(map['events'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comic.fromJson(String source) =>
      Comic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      digitalId,
      title,
      issueNumber,
      variantDescription,
      description,
      modified,
      isbn,
      upc,
      diamondCode,
      ean,
      issn,
      format,
      pageCount,
      textObjects,
      resourceUri,
      urls,
      series,
      variants,
      collections,
      collectedIssues,
      dates,
      prices,
      thumbnail,
      images,
      creators,
      characters,
      stories,
      events,
    ];
  }
}
