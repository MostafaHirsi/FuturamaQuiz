import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character(
      {required int id,
      String? age,
      String? gender,
      String? species,
      String? homePlanet,
      String? occupation,
      List<String>? sayings,
      Name? name,
      Images? images}) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({String? headShot, String? main}) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name({String? first, String? middle, String? last}) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
