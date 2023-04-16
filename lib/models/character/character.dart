import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character(
      {required String id,
      required String age,
      required String gender,
      required String species,
      required String homePlanet,
      required String occupation,
      required List<String> sayings,
      required Name name,
      required Images images}) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({required String headShot, required String main}) =
      _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@freezed
class Name with _$Name {
  const factory Name(
      {required String first,
      required String middle,
      required String last}) = _Name;

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);
}
