import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futurama_quiz/models/character/character.dart';
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
}
