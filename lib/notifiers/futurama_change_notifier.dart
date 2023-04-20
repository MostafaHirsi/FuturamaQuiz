import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/models/info/info.dart';
import 'package:futurama_quiz/models/question/question.dart';
import 'package:futurama_quiz/states/futurama_state.dart';

import '../repository/futurama_repository.dart';

class FuturamaChangeNotifier extends ChangeNotifier {
  final FuturamaRepository futuramaRepository;
  FuturamaState futuramaState = FuturamaState();

  FuturamaChangeNotifier(this.futuramaRepository);

  Future<void> fetchCharacters() async {
    try {
      futuramaState = futuramaState.copyWith(
        charactersState: const CharactersState(isLoading: true),
      );
      notifyListeners();
      List<Character> characters = await futuramaRepository.fetchCharacters();
      futuramaState = futuramaState.copyWith(
        charactersState:
            CharactersState(isLoading: false, characters: characters),
      );
      notifyListeners();
    } catch (exception) {
      futuramaState = futuramaState.copyWith(
        charactersState: const CharactersState(
            isLoading: false,
            error: "Couldn't retrieve characters, please try again later",
            hasError: true),
      );
    }
  }

  Future<void> fetchQuestions() async {
    try {
      futuramaState = futuramaState.copyWith(
        questionsState: const QuestionsState(isLoading: true),
      );
      notifyListeners();
      List<Question> questions = await futuramaRepository.fetchQuestions();
      futuramaState = futuramaState.copyWith(
        questionsState: QuestionsState(isLoading: false, questions: questions),
      );
      notifyListeners();
    } catch (exception) {
      futuramaState = futuramaState.copyWith(
        questionsState: const QuestionsState(
            isLoading: false,
            error: "Couldn't retrieve questions, please try again later",
            hasError: true),
      );
    }
  }

  Future<void> fetchInfo() async {
    try {
      futuramaState = futuramaState.copyWith(
        infoState: const InfoState(isLoading: true),
      );
      notifyListeners();
      Info? info = await futuramaRepository.fetchInfo();
      futuramaState = futuramaState.copyWith(
        infoState: InfoState(isLoading: false, info: info),
      );
      notifyListeners();
    } catch (exception) {
      futuramaState = futuramaState.copyWith(
        infoState: const InfoState(
            isLoading: false,
            error: "Couldn't retrieve info, please try again later",
            hasError: true),
      );
    }
  }
}
