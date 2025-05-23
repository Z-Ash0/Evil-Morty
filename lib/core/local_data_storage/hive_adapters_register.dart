import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/location.dart';
import 'package:rick_and_morty_app/features/characters/data/models/origin.dart';

class HiveAdapterRegister {
  static void registerAll() {
    Hive.registerAdapter(CharactersModelAdapter());
    Hive.registerAdapter(OriginAdapter());
    Hive.registerAdapter(LocationAdapter());
  }
}
