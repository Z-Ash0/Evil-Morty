import 'package:hive_flutter/hive_flutter.dart';
import 'package:rick_and_morty_app/features/characters/data/models/origin.dart';
import '../../features/characters/data/models/characters_model.dart';
import '../../features/characters/data/models/location.dart';

abstract class LocalDataStorage {
  Future<void> init();
  Future<void> openBoxes();
  Future<void> addCharacter(CharactersModel character);
  Future<List<CharactersModel>> getAllCharacters();
  void registerAllAdapters();
  void registerAdapterAfterCheck(TypeAdapter adapter);
}

class HiveService implements LocalDataStorage {
  static const String _charactersBoxName = 'characters';

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    registerAllAdapters();
    await openBoxes();
  }

  @override
  Future<void> openBoxes() async {
    if (!Hive.isBoxOpen(_charactersBoxName)) {
      await Hive.openBox<CharactersModel>(_charactersBoxName);
    }
  }

  @override
  Future<void> addCharacter(CharactersModel character) async {
    final box = Hive.box<CharactersModel>(_charactersBoxName);
    await box.add(character);
  }

  @override
  Future<List<CharactersModel>> getAllCharacters() async {
    final box = Hive.box<CharactersModel>(_charactersBoxName);
    return box.values.toList();
  }

  @override
  void registerAllAdapters() {
    registerAdapterAfterCheck(CharactersModelAdapter());
    registerAdapterAfterCheck(LocationAdapter());
    registerAdapterAfterCheck(OriginAdapter());
  }

  @override
  void registerAdapterAfterCheck(TypeAdapter adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }
}
