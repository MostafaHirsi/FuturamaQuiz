import 'package:flutter/material.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/states/futurama_state.dart';

import '../repository/futurama_repository.dart';

class FuturamaDataNotifier extends ChangeNotifier {
  final FuturamaRepository futuramaRepository;
  FuturamaState futuramaState = FuturamaState();

  FuturamaDataNotifier(this.futuramaRepository);

  Future<void> fetchCharacters() async {
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
  }
}
