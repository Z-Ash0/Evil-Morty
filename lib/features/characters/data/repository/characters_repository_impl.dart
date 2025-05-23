import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/characters/data/data_sources/characters_local_data_src.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/data/data_sources/characters_remote_data_src.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';

class CharactersRepositoryImpl extends CharactersRepository {
  CharactersRepositoryImpl(
      {required this.charactersRemoteDataSrc,
      required this.charactersLocalDataSrc});
  final CharactersRemoteDataSrc charactersRemoteDataSrc;
  final CharactersLocalDataSrc charactersLocalDataSrc;
  List<CharactersModel> allCharacters = [];

  @override
  Future<ApiResult<List<CharactersModel>>> fetchCharactersData(
      {bool isMore = false}) async {
    try {
      if (!isMore && charactersLocalDataSrc.hassCachedData()) {
        final cachedData = charactersLocalDataSrc.getCachedCharacters();
        return ApiResult.success(cachedData);
      }

      allCharacters += await _getRemoteCharactersList(isMore);
      if (!isMore) {
        await charactersLocalDataSrc.cacheCharacters(allCharacters);
      }
      return ApiResult.success(allCharacters);
    } catch (e) {
      if (!isMore && charactersLocalDataSrc.hassCachedData()) {
        final cachedData = charactersLocalDataSrc.getCachedCharacters();
        return ApiResult.success(cachedData);
      }
      return ApiResult.failure(e);
    }
  }

  Future<List<CharactersModel>> _getRemoteCharactersList(bool isMore) async {
    final characterList =
        await charactersRemoteDataSrc.getAllCharacters(isMore: isMore);
    return characterList
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }
}
