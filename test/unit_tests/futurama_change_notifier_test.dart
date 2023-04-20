import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/models/info/info.dart';
import 'package:futurama_quiz/models/question/question.dart';
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

  Info sampleInfo = const Info(
      id: 1,
      sayings: [Creator(name: 'Matt Groening', url: 'google.com')],
      synopsis: '',
      yearsAired: '');

  Question sampleQuestion1 = Question(
      id: 1,
      correctAnswer: 'Fry',
      possibleAnswers: ['Fry', 'Bender', 'Sheila'],
      question: 'Who is the main character');

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

  group('Test futurama fetchInfo function', () {
    test('Test fetchInfo', () async {
      when(futuramaRepository.fetchInfo()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => sampleInfo,
        ),
      );
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, false);
      final fetchInfo = futuramaDataNotifier.fetchInfo();
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, true);
      await fetchInfo;
      expect(futuramaDataNotifier.futuramaState.infoState.info != null, true);
      expect(futuramaDataNotifier.futuramaState.infoState.info, sampleInfo);
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, false);
      expect(futuramaDataNotifier.futuramaState.infoState.hasError, false);
      expect(futuramaDataNotifier.futuramaState.infoState.error, "");
    });
    test('Test fetchInfo with http error', () async {
      when(futuramaRepository.fetchInfo()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => throw HttpException("Bad internet connection"),
        ),
      );
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, false);
      final fetchInfo = futuramaDataNotifier.fetchInfo();
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, true);
      await fetchInfo;
      expect(futuramaDataNotifier.futuramaState.infoState.info == null, true);
      expect(futuramaDataNotifier.futuramaState.infoState.isLoading, false);
      expect(futuramaDataNotifier.futuramaState.infoState.hasError, true);
      expect(futuramaDataNotifier.futuramaState.infoState.error,
          "Couldn't retrieve info, please try again later");
    });
  });

  group('Test futurama fetchQuestions function', () {
    test('Test fetchQuestions', () async {
      when(futuramaRepository.fetchQuestions()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => [sampleQuestion1],
        ),
      );
      expect(
          futuramaDataNotifier.futuramaState.questionsState.isLoading, false);
      final fetchQuestions = futuramaDataNotifier.fetchQuestions();
      expect(futuramaDataNotifier.futuramaState.questionsState.isLoading, true);
      await fetchQuestions;
      expect(futuramaDataNotifier.futuramaState.questionsState.questions.length,
          1);
      expect(futuramaDataNotifier.futuramaState.questionsState.questions,
          [sampleQuestion1]);
      expect(
          futuramaDataNotifier.futuramaState.questionsState.isLoading, false);
      expect(futuramaDataNotifier.futuramaState.questionsState.hasError, false);
      expect(futuramaDataNotifier.futuramaState.questionsState.error, "");
    });

    test('Test fetchInfo with http error', () async {
      when(futuramaRepository.fetchQuestions()).thenAnswer(
        (_) => Future.delayed(
          const Duration(
            seconds: 2,
          ),
          () => throw HttpException("Bad internet connection"),
        ),
      );
      expect(
          futuramaDataNotifier.futuramaState.questionsState.isLoading, false);
      final fetchQuestions = futuramaDataNotifier.fetchQuestions();
      expect(futuramaDataNotifier.futuramaState.questionsState.isLoading, true);
      await fetchQuestions;
      expect(futuramaDataNotifier.futuramaState.questionsState.questions.length,
          0);
      expect(futuramaDataNotifier.futuramaState.questionsState.questions, []);
      expect(
          futuramaDataNotifier.futuramaState.questionsState.isLoading, false);
      expect(futuramaDataNotifier.futuramaState.questionsState.hasError, true);
      expect(futuramaDataNotifier.futuramaState.questionsState.error,
          "Couldn't retrieve questions, please try again later");
    });
  });
}
