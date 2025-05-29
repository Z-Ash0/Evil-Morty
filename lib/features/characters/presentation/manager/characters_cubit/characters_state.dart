import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';

class CharactersState {}

class AllCharactersLoading extends CharactersState {}

class AllCharactersLoaded extends CharactersState {
  final List<CharactersModel> charactersList;
  AllCharactersLoaded({required this.charactersList});
}

class AllCharactersFailed extends CharactersState {
  final ApiErrorModel errorModel;
  AllCharactersFailed({required this.errorModel});
}

class AllCharactersPaginationError extends CharactersState {
  final List<CharactersModel> charactersList;
  final String errorMessage;

  AllCharactersPaginationError({
    required this.charactersList,
    required this.errorMessage,
  });
}

class AllCharactersFiltered extends CharactersState {
  final List<CharactersModel> searchedCharacters;

  AllCharactersFiltered({required this.searchedCharacters});
}
