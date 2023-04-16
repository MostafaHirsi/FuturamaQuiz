import 'package:dio/dio.dart';

import '../models/character/character.dart';
import '../models/info/info.dart';
import '../models/question/question.dart';

class FuturamaApiService {
  final Dio dio;

  FuturamaApiService(this.dio) {
    dio.options = BaseOptions(
      baseUrl: 'https://api.sampleapis.com/futurama',
      validateStatus: (status) {
        return status == 200 || status == 404;
      },
    );
  }

  Future<Info?> getInfo() async {
    Response response = await dio.get('/info');
    if (response.statusCode == 404) {
      return null;
    }
    Info info = Info.fromJson(response.data);
    return info;
  }

  Future<List<Character>?> getCharacters() async {
    Response response = await dio.get('/characters');
    if (response.statusCode == 404) {
      return null;
    }
    List responseList = response.data;

    List<Character> characters = responseList
        .map((rawCharacter) => Character.fromJson(rawCharacter))
        .toList();
    return characters;
  }

  Future<List<Question>?> getQuestions() async {
    Response response = await dio.get('/questions');
    if (response.statusCode == 404) {
      return null;
    }
    List responseList = response.data;

    List<Question> questions = responseList
        .map((rawQuestion) => Question.fromJson(rawQuestion))
        .toList();
    return questions;
  }
}
