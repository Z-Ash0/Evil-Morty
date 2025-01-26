import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_state.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersState());
  final CharactersRepository charactersRepository;
  late List<CharactersModel> characters;

  List<CharactersModel> getCharactersFromRepo() {
    emit(AllCharactersLoading());
    try {
      charactersRepository.fetchCharactersData().then((characters) {
        emit(AllCharactersLoaded(charactersList: characters));
        this.characters = characters;
      });
      return characters;
    } on Exception catch (e) {
      emit(AllCharactersFailed(errorMsg: e.toString()));
      return [];
    }
  }
}
