import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/web_services/characters_services.dart';

class CharactersRepository {
  CharactersRepository(this.charactersServices);
  final CharactersServices charactersServices;
  List<CharactersModel> allCharactersList = [];

  Future<List<CharactersModel>> fetchCharactersData(
      {bool isMore = false}) async {
    final characterList =
        await charactersServices.getCharacterData(isMore: isMore);
    allCharactersList += characterList
        .map((character) => CharactersModel.fromJson(character))
        .toList();
    return allCharactersList;
  }
}
