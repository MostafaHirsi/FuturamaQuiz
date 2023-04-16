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
  when(futuramaRepository.fetchCharacters()).thenAnswer(
    (_) => Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () => [sampleCharacter1],
    ),
  );

  FuturamaChangeNotifier futuramaDataNotifier =
      FuturamaChangeNotifier(futuramaRepository);

  group('Test futurama data notifier', () {
    test('Test fetching characters', () async {
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
    });
  });
}
