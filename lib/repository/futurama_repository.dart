import 'package:futurama_quiz/api/futurama_provider.dart';
import 'package:futurama_quiz/models/character/character.dart';

class FuturamaRepository {
  final FuturamaApiService futuramaApiService;

  FuturamaRepository(this.futuramaApiService);

  Future<List<Character>> fetchCharacters() async {
    try {
      List<dynamic> rawCharacters = await futuramaApiService.getCharacters();
      List<Character> characters = rawCharacters
          .map((rawCharacter) => Character.fromJson(rawCharacter))
          .toList();
      return characters;
    } catch (e) {
      return [];
    }
  }
}
