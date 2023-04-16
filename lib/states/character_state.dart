import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/character/character.dart';

part 'character_state.freezed.dart';

@freezed
class CharacterState with _$CharacterState {
  factory CharacterState({
    @Default(null) Character? character,
    @Default(true) bool isLoading,
  }) = _CharacterState;
}
