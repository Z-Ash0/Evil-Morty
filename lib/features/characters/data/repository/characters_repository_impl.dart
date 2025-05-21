import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/data/data_sources/characters_remote_data_src.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  CharactersRepositoryImpl(this.charactersServices);
  final CharactersRemoteDataSrc charactersServices;
  List<CharactersModel> allCharactersList = [];

  @override
  Future<ApiResult<List<CharactersModel>>> fetchCharactersData(
      {bool isMore = false}) async {
    try {
      allCharactersList += await _getCharactersList(isMore);
      return ApiResult.success(allCharactersList);
    } catch (e) {
      return ApiResult.failure(e);
    }
  }

  Future<List<CharactersModel>> _getCharactersList(bool isMore) async {
    final characterList =
        await charactersServices.getCharacterData(isMore: isMore);
    return characterList
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }
}
