import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/notifiers/futurama_change_notifier.dart';
import 'package:futurama_quiz/repository/futurama_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'futurama_change_notifier_test.mocks.dart';

@GenerateMocks([FuturamaRepository])
void main() {
  FuturamaRepository futuramaRepository = MockFuturamaRepository();
  Character sampleCharacter1 = const Character(
      id: 1, name: Name(first: 'John', middle: 'Dimothy', last: 'Doe'));

  FuturamaChangeNotifier futuramaDataNotifier =
      FuturamaChangeNotifier(futuramaRepository);

  group('Test futurama fetchCharacters function', () {
    test('Test fetchCharacters', () async {
      when(futuramaRepository.fetchCharacters()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => [sampleCharacter1],
        ),
      );
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, false);
      final fetchCharacters = futuramaDataNotifier.fetchCharacters();
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, true);
      await fetchCharacters;
      expect(
          futuramaDataNotifier.futuramaState.charactersState.characters.length,
          1);
      expect(futuramaDataNotifier.futuramaState.charactersState.characters,
          [sampleCharacter1]);
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, false);
      expect(
          futuramaDataNotifier.futuramaState.charactersState.hasError, false);
      expect(futuramaDataNotifier.futuramaState.charactersState.error, "");
    });
    test('Test fetchCharacters with http error', () async {
      when(futuramaRepository.fetchCharacters()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => throw HttpException("Bad internet connection"),
        ),
      );
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, false);
      final fetchCharacters = futuramaDataNotifier.fetchCharacters();
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, true);
      await fetchCharacters;
      expect(
          futuramaDataNotifier.futuramaState.charactersState.characters.length,
          0);
      expect(futuramaDataNotifier.futuramaState.charactersState.characters, []);
      expect(
          futuramaDataNotifier.futuramaState.charactersState.isLoading, false);
      expect(futuramaDataNotifier.futuramaState.charactersState.hasError, true);
      expect(futuramaDataNotifier.futuramaState.charactersState.error,
          "Couldn't retrieve characters, please try again later");
    });
  });
}
