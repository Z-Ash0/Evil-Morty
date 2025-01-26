import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/web_services/characters_services.dart';

class CharactersRepository {
  CharactersRepository(this.charactersServices);
  final CharactersServices charactersServices;

  Future<List<CharactersModel>> fetchCharactersData() async {
    final characterList = await charactersServices.getCharacterData();
    return characterList
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }
}
