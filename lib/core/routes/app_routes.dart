import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/features/characters/presentation/view/characters_screen.dart';

class AppRoutes {
  Route? generateRoutes(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const CharactersScreen());
      default:
        return null;
    }
  }
}
