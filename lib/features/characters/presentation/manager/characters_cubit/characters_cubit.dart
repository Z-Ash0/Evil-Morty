import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/local_statuscode.dart';
import 'package:rick_and_morty_app/features/characters/domain/repos/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/presentation/manager/characters_cubit/characters_state.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  TextEditingController txtController = TextEditingController();
  List<CharactersModel> allCharacters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersState()) {
    txtController.addListener(() {
      emit(AllCharactersFiltered(
          searchedCharacters: filteredList(txtController.text.toLowerCase())));
    });
  }

  Future<void> getCharactersFromRepo({bool isMore = false}) async {
    isMore ? null : emit(AllCharactersLoading());

    final result =
        await charactersRepository.fetchCharactersData(isMore: isMore);
    result.when(onSuccess: (data) {
      allCharacters += data;
      emit(AllCharactersLoaded(charactersList: allCharacters));
    }, onFailure: (error) {
      if (isMore &&
          allCharacters.isNotEmpty &&
          error.statusCode == LocalStatuscode.connectionError) {
        emit(AllCharactersPaginationError(
            errorMessage: error.message, charactersList: allCharacters));
      }
      emit(AllCharactersFailed(errorModel: error));
    });
  }

  //* assigning the values of the searched elements to the searchedCharacters by looping around each element of the allCharacters list and filtering based on the condintion we've put
  List<CharactersModel> filteredList(String searchedChar) {
    return allCharacters
        .where(
            (character) => character.name.toLowerCase().contains(searchedChar))
        .toList();
  }
}
