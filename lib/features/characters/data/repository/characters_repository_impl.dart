import 'package:rick_and_morty_app/features/characters/data/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/data/web_services/characters_services.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  CharactersRepositoryImpl(this.charactersServices);
  final CharactersServices charactersServices;
  List<CharactersModel> allCharactersList = [];

  @override
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
