import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';

abstract class CharactersRepository {
  Future<ApiResult<List<CharactersModel>>> fetchCharactersData(
      {bool isMore = false});
}
