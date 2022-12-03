import 'dart:convert';

import 'known_for.dart';

class PPlResult {
  bool? adult;
  int? id;
  String? name;
  String? originalName;
  String? mediaType;
  double? popularity;
  int? gender;
  String? knownForDepartment;
  String? profilePath;
  List<KnownFor>? knownFor;

  PPlResult({
    this.adult,
    this.id,
    this.name,
    this.originalName,
    this.mediaType,
    this.popularity,
    this.gender,
    this.knownForDepartment,
    this.profilePath,
    this.knownFor,
  });

  factory PPlResult.fromMap(Map<String, dynamic> data) => PPlResult(
        adult: data['adult'] as bool?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        originalName: data['original_name'] as String?,
        mediaType: data['media_type'] as String?,
        popularity: (data['popularity'] as num?)?.toDouble(),
        gender: data['gender'] as int?,
        knownForDepartment: data['known_for_department'] as String?,
        profilePath: data['profile_path'] as String?,
        knownFor: (data['known_for'] as List<dynamic>?)
            ?.map((e) => KnownFor.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'adult': adult,
        'id': id,
        'name': name,
        'original_name': originalName,
        'media_type': mediaType,
        'popularity': popularity,
        'gender': gender,
        'known_for_department': knownForDepartment,
        'profile_path': profilePath,
        'known_for': knownFor?.map((e) => e.toMap()).toList(),
      };

  /// Parses the string and returns the PPlResulting Json object as [PPlResult].
  static List<PPlResult> fromJson(String source) =>
      (json.decode(source)["results"] as List)
          .map((e) => PPlResult.fromMap(e as Map<String, dynamic>))
          .toList();

  /// `dart:convert`
  ///
  /// Converts [PPlResult] to a JSON string.
  String toJson() => json.encode(toMap());
}
