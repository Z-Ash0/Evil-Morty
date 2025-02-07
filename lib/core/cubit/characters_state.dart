import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CharactersState {}

class AllCharactersLoading extends CharactersState {}

class AllCharactersLoaded extends CharactersState {
  final List<CharactersModel> charactersList;
  AllCharactersLoaded({required this.charactersList});
}

class AllCharactersFailed extends CharactersState {
  final String errorMsg;
  AllCharactersFailed({required this.errorMsg});
}

class AllCharactersFiltered extends CharactersState {
  final List<CharactersModel> searchedCharacters;

  AllCharactersFiltered({required this.searchedCharacters});
}
