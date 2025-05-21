import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';

abstract class CharactersLocalDataSrc {
  List<CharactersModel> getCharacterData();
}

class CharactersLocalDataSrcImpl extends CharactersLocalDataSrc {
  @override
  List<CharactersModel> getCharacterData() {
    // TODO: implement getCharacterData
    throw UnimplementedError();
  }
}
