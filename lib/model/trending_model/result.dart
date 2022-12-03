import 'dart:convert';

import 'package:flutter/foundation.dart';

class Result {
  final bool adult;
  final String backdrop_path;
  final int id;
  final String title;
  final String original_language;
  final String original_title;
  final String overview;
  final String poster_path;
  final String media_type;
  final List<int> genre_ids;
  final double popularity;
  final String release_date;
  final bool video;
  final double vote_average;
  final int vote_count;
  Result({
    required this.adult,
    required this.backdrop_path,
    required this.id,
    required this.title,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.poster_path,
    required this.media_type,
    required this.genre_ids,
    required this.popularity,
    required this.release_date,
    required this.video,
    required this.vote_average,
    required this.vote_count,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdrop_path,
      'id': id,
      'title': title,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'poster_path': poster_path,
      'media_type': media_type,
      'genre_ids': genre_ids,
      'popularity': popularity,
      'release_date': release_date,
      'video': video,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      adult: map['adult'] as bool,
      backdrop_path: map['backdrop_path'] as String,
      id: map['id'].toInt() as int,
      title: map['title'] as String,
      original_language: map['original_language'] as String,
      original_title: map['original_title'] as String,
      overview: map['overview'] as String,
      poster_path: map['poster_path'] as String,
      media_type: map['media_type'] as String,
      genre_ids: List<int>.from((map['genre_ids'])),
      popularity: map['popularity'].toDouble() as double,
      release_date: map['release_date'] as String,
      video: map['video'] as bool,
      vote_average: map['vote_average'].toDouble() as double,
      vote_count: map['vote_count'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  static List<Result> fromJson(String source) =>
      (json.decode(source)["results"] as List)
          .map((e) => Result.fromMap(e as Map<String, dynamic>))
          .toList();

  @override
  String toString() {
    return 'Result(adult: $adult, backdrop_path: $backdrop_path, id: $id, title: $title, original_language: $original_language, original_title: $original_title, overview: $overview, poster_path: $poster_path, media_type: $media_type, genre_ids: $genre_ids, popularity: $popularity, release_date: $release_date, video: $video, vote_average: $vote_average, vote_count: $vote_count)';
  }

  @override
  bool operator ==(covariant Result other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.backdrop_path == backdrop_path &&
        other.id == id &&
        other.title == title &&
        other.original_language == original_language &&
        other.original_title == original_title &&
        other.overview == overview &&
        other.poster_path == poster_path &&
        other.media_type == media_type &&
        listEquals(other.genre_ids, genre_ids) &&
        other.popularity == popularity &&
        other.release_date == release_date &&
        other.video == video &&
        other.vote_average == vote_average &&
        other.vote_count == vote_count;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        backdrop_path.hashCode ^
        id.hashCode ^
        title.hashCode ^
        original_language.hashCode ^
        original_title.hashCode ^
        overview.hashCode ^
        poster_path.hashCode ^
        media_type.hashCode ^
        genre_ids.hashCode ^
        popularity.hashCode ^
        release_date.hashCode ^
        video.hashCode ^
        vote_average.hashCode ^
        vote_count.hashCode;
  }
}
