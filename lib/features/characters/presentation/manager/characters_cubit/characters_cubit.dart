import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/presentation/manager/characters_cubit/characters_state.dart';
import 'package:rick_and_morty_app/features/characters/data/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/data/repository/characters_repository_impl.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepositoryImpl charactersRepository;
  TextEditingController txtController = TextEditingController();
  List<CharactersModel> allCharacters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersState()) {
    txtController.addListener(() {
      emit(AllCharactersFiltered(
          searchedCharacters: filteredList(txtController.text.toLowerCase())));
    });
  }

  Future<void> getCharactersFromRepo({bool isMore = false}) async {
    if (isMore) {
    } else {
      emit(AllCharactersLoading());
    }
    try {
      allCharacters =
          await charactersRepository.fetchCharactersData(isMore: isMore);
      emit(AllCharactersLoaded(charactersList: allCharacters));
    } on Exception catch (e) {
      emit(AllCharactersFailed(errorMsg: e.toString()));
      //! Check the error message
    }
  }

  //* assigning the values of the searched elements to the searchedCharacters by looping around each element of the allCharacters list and filtering based on the condintion we've put
  List<CharactersModel> filteredList(String searchedChar) {
    return allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedChar))
        .toList();
  }
}
