import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/character/character.dart';
import '../models/info/info.dart';
import '../models/question/question.dart';

part 'futurama_state.freezed.dart';

@freezed
class FuturamaState with _$FuturamaState {
  factory FuturamaState({
    @Default(CharactersState()) CharactersState charactersState,
    @Default(QuestionsState()) QuestionsState questionsState,
    @Default(InfoState()) InfoState infoState,
  }) = _FuturamaState;
}

class CharactersState {
  final List<Character> characters;
  final bool isLoading;

  const CharactersState({this.characters = const [], this.isLoading = false});
}

class QuestionsState {
  final List<Question> questions;
  final bool isLoading;

  const QuestionsState({this.questions = const [], this.isLoading = false});
}

class InfoState {
  final Info? info;
  final bool isLoading;

  const InfoState({this.info, this.isLoading = false});
}
