import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/services/service_locator.dart';
import 'package:rick_and_morty_app/features/characters/presentation/manager/characters_cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/OnBoarding/presentation/view/on_boarding_screen.dart';
import 'package:rick_and_morty_app/features/characters/data/models/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/character_details.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_screen.dart';

class AppRoutes {
  Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case charactersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<CharactersCubit>(),
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
