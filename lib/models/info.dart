import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Info extends Equatable {
  final String id;
  final String synopsis;
  final String yearsAired;
  final List<Creator> creators;

  Info(this.id, this.synopsis, this.yearsAired, this.creators);
  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  @override
  List<Object?> get props => [id, synopsis, yearsAired, creators];
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Creator extends Equatable {
  final String name;
  final String url;

  Creator(this.name, this.url);
  factory Creator.fromJson(Map<String, dynamic> json) =>
      _$CreatorFromJson(json);

  @override
  List<Object?> get props => [name, url];
}
