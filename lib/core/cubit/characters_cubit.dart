import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_state.dart';
import 'package:rick_and_morty_app/features/characters/repository/characters_repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersState());
  final CharactersRepository charactersRepository;

  Future<void> getCharactersFromRepo() async {
    emit(AllCharactersLoading());
    try {
      await charactersRepository.fetchCharactersData().then((characters) {
        emit(AllCharactersLoaded(charactersList: characters));
      });
    } on Exception catch (e) {
      emit(AllCharactersFailed(
          errorMsg: e.toString())); //! Check the error message
    }
  }
}
