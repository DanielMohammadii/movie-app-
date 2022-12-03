import 'dart:convert';

import 'ppl_result.dart';

class Ppl {
  int? page;
  List<PPlResult>? results;
  int? totalPages;
  int? totalResults;

  Ppl({this.page, this.results, this.totalPages, this.totalResults});

  factory Ppl.fromMap(Map<String, dynamic> data) => Ppl(
        page: data['page'] as int?,
        results: (data['results'] as List<dynamic>?)
            ?.map((e) => PPlResult.fromMap(e as Map<String, dynamic>))
            .toList(),
        totalPages: data['total_pages'] as int?,
        totalResults: data['total_results'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'page': page,
        'results': results?.map((e) => e.toMap()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Ppl].
  factory Ppl.fromJson(String data) {
    return Ppl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Ppl] to a JSON string.
  String toJson() => json.encode(toMap());
}
