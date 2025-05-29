import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_app/core/networking/api_error_handler.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
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
  int currentPage = 1;
  bool hasMorePages = true;

  @override
  Future<ApiResult<List<CharactersModel>>> fetchCharactersData(
      {bool isMore = false}) async {
    try {
      if (!isMore && charactersLocalDataSrc.hassCachedData()) {
        final cachedData = charactersLocalDataSrc.getCachedCharacters();
        return ApiResult.success(cachedData);
      }
      if (!isMore) {
        currentPage = 1;
        hasMorePages = true;
      }

      final newCharacters = await _getRemoteCharactersList(
          pageNumber: isMore ? currentPage + 1 : currentPage);

      if (!isMore) {
        await charactersLocalDataSrc.clearCache();
        await charactersLocalDataSrc.cacheCharacters(newCharacters);
      } else {
        currentPage++;
        if (newCharacters.isEmpty) {
          hasMorePages = false;
        } else {
          await charactersLocalDataSrc.cacheCharacters(newCharacters);
        }
      }

      if (isMore && !hasMorePages) {
        return ApiResult.success(<CharactersModel>[]);
      }

      return ApiResult.success(newCharacters);
    } catch (e) {
      debugPrint(
          'An error happened -----------------------------------------------------------------------------------------------------------------------');
      final ApiErrorModel errorModel = ApiErrorHandler.handle(e);
      if (isMore && errorModel.isLastPage) {
        hasMorePages = false;
        return ApiResult.success([]);
      }
      return ApiResult.failure(errorModel);
    }
  }

  Future<List<CharactersModel>> _getRemoteCharactersList(
      {required int pageNumber}) async {
    final characterList =
        await charactersRemoteDataSrc.getAllCharacters(pageNumber: pageNumber);
    return characterList
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }
}
