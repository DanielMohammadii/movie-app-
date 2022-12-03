import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'result.dart';

class MovieTredningModel {
  final int page;
  final List<Result> results;
  final int total_pages;
  final int total_results;
  MovieTredningModel({
    required this.page,
    required this.results,
    required this.total_pages,
    required this.total_results,
  });

  MovieTredningModel copyWith({
    int? page,
    List<Result>? results,
    int? total_pages,
    int? total_results,
  }) {
    return MovieTredningModel(
      page: page ?? this.page,
      results: results ?? this.results,
      total_pages: total_pages ?? this.total_pages,
      total_results: total_results ?? this.total_results,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'results': results.map((x) => x.toMap()).toList(),
      'total_pages': total_pages,
      'total_results': total_results,
    };
  }

  factory MovieTredningModel.fromMap(Map<String, dynamic> map) {
    return MovieTredningModel(
      page: map['page'].toInt() as int,
      results: List<Result>.from(
        (map['results'] as List<int>).map<Result>(
          (x) => Result.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total_pages: map['total_pages'].toInt() as int,
      total_results: map['total_results'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieTredningModel.fromJson(String source) =>
      MovieTredningModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MovieTredningModel(page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
  }

  @override
  bool operator ==(covariant MovieTredningModel other) {
    if (identical(this, other)) return true;

    return other.page == page &&
        listEquals(other.results, results) &&
        other.total_pages == total_pages &&
        other.total_results == total_results;
  }

  @override
  int get hashCode {
    return page.hashCode ^
        results.hashCode ^
        total_pages.hashCode ^
        total_results.hashCode;
  }
}
