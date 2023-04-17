import 'package:futurama_quiz/api/futurama_api_service.dart';
import 'package:futurama_quiz/models/character/character.dart';
import 'package:futurama_quiz/models/info/info.dart';
import 'package:futurama_quiz/models/question/question.dart';

class FuturamaRepository {
  final FuturamaApiService futuramaApiService;

  FuturamaRepository(this.futuramaApiService);

  Future<List<Character>> fetchCharacters() async {
    List<dynamic> rawCharacters = await futuramaApiService.getCharacters();
    List<Character> characters = rawCharacters
        .map((rawCharacter) => Character.fromJson(rawCharacter))
        .toList();
    return characters;
  }

  Future<Info?> fetchInfo() async {
    Map<String, dynamic> rawInfo = await futuramaApiService.getInfo();
    return Info.fromJson(rawInfo);
  }

  Future<List<Question>> fetchQuestions() async {
    List<dynamic> rawQuestions = await futuramaApiService.getQuestions();
    List<Question> questions = rawQuestions
        .map((rawQuestion) => Question.fromJson(rawQuestion))
        .toList();
    return questions;
  }
}
