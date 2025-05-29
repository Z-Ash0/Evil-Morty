import 'package:rick_and_morty_app/core/local_data_storage/local_data_storage.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';

abstract class CharactersLocalDataSrc {
  List<CharactersModel> getCachedCharacters();
  Future<void> cacheCharacters(List<CharactersModel> characters);
  bool hassCachedData();
  Future<void> clearCache();
}

class CharactersLocalDataSrcImpl extends CharactersLocalDataSrc {
  final LocalDataStorage<CharactersModel> localDataStorage;
  CharactersLocalDataSrcImpl({required this.localDataStorage});

  @override
  Future<void> cacheCharacters(List<CharactersModel> characters) async {
    // await localDataStorage.clear();
    await localDataStorage.addAll(characters);
  }

  @override
  List<CharactersModel> getCachedCharacters() => localDataStorage.getAll();

  @override
  bool hassCachedData() => getCachedCharacters().isNotEmpty;
  @override
  Future<void> clearCache() async => await localDataStorage.clear();
}
