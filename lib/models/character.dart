import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Character extends Equatable {
  final String id;
  final String age;
  final String gender;
  final String species;
  final String homePlanet;
  final String occupation;
  final List<String> sayings;
  final Name name;
  final Images images;

  const Character(this.id, this.age, this.gender, this.species, this.homePlanet,
      this.occupation, this.sayings, this.name, this.images);
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  @override
  List<Object?> get props =>
      [id, age, gender, species, homePlanet, occupation, sayings, name, images];
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Images extends Equatable {
  final String headShot;
  final String main;

  const Images(this.headShot, this.main);
  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  @override
  List<Object?> get props => [
        headShot,
        main,
      ];
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Name extends Equatable {
  final String first;
  final String middle;
  final String last;

  const Name(this.first, this.middle, this.last);
  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  @override
  List<Object?> get props => [first, middle, last];
}
