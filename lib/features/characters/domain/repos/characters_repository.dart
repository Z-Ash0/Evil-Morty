import 'package:rick_and_morty_app/features/characters/data/model/characters_model.dart';

abstract class CharactersRepository {
  Future<List<CharactersModel>> fetchCharactersData({bool isMore = false});
}
