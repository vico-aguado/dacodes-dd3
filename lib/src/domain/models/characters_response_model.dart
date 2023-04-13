// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dacodes_dd3/src/domain/models/general.dart';
import 'package:equatable/equatable.dart';

class CharectersResponse<T extends Mappable> extends Equatable {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHtml;
  final String etag;
  final CharectersData<T> data;

  const CharectersResponse(
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  );

  CharectersResponse copyWith({
    int? code,
    String? status,
    String? copyright,
    String? attributionText,
    String? attributionHtml,
    String? etag,
    CharectersData<T>? data,
  }) {
    return CharectersResponse<T>(
      code ?? this.code,
      status ?? this.status,
      copyright ?? this.copyright,
      attributionText ?? this.attributionText,
      attributionHtml ?? this.attributionHtml,
      etag ?? this.etag,
      data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'status': status,
      'copyright': copyright,
      'attributionText': attributionText,
      'attributionHTML': attributionHtml,
      'etag': etag,
      'data': data.toMap(),
    };
  }

  factory CharectersResponse.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromMap,
  ) {
    return CharectersResponse<T>(
      map['code'] as int,
      map['status'] as String,
      map['copyright'] as String,
      map['attributionText'] as String,
      map['attributionHTML'] as String,
      map['etag'] as String,
      CharectersData<T>.fromMap(map['data'] as Map<String, dynamic>, fromMap),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharectersResponse.fromJson(
    String source,
    T Function(dynamic) fromJson,
  ) =>
      CharectersResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
        fromJson,
      );

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      code,
      status,
      copyright,
      attributionText,
      attributionHtml,
      etag,
      data,
    ];
  }
}

class CharectersData<T extends Mappable> extends Equatable {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<T> results;

  const CharectersData({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  CharectersData<T> copyWith({
    int? offset,
    int? limit,
    int? total,
    int? count,
    List<T>? results,
  }) {
    return CharectersData(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      total: total ?? this.total,
      count: count ?? this.count,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory CharectersData.fromMap(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return CharectersData<T>(
      offset: map['offset'] as int,
      limit: map['limit'] as int,
      total: map['total'] as int,
      count: map['count'] as int,
      results: List<T>.from(
        (map['results'] as List<dynamic>).map<T>(
          (x) => fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CharectersData.fromJson(
    String source,
    T Function(Map<String, dynamic>) fromJson,
  ) =>
      CharectersData.fromMap(
        json.decode(source) as Map<String, dynamic>,
        fromJson,
      );

  @override
  String toString() {
    return 'CharectersData(offset: $offset, limit: $limit, total: $total, count: $count, results: $results)';
  }

  @override
  List<Object> get props {
    return [
      offset,
      limit,
      total,
      count,
      results,
    ];
  }
}
