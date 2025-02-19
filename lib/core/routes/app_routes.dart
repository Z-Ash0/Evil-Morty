import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/view/character_details.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_screen.dart';
import 'package:rick_and_morty_app/features/characters/repository/characters_repository.dart';
import 'package:rick_and_morty_app/features/characters/web_services/characters_services.dart';

class AppRoutes {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRoutes() {
    charactersRepository = CharactersRepository(CharactersServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case detailsScreen:
        final character = routeSettings.arguments as CharactersModel;
        return MaterialPageRoute(
          builder: (context) => CharacterDetails(character: character),
        );

      default:
        return null;
    }
  }
}
