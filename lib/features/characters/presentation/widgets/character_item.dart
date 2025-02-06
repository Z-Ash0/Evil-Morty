import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            image: character.image,
            placeholder: Assets.assetsLoadingIndicator,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                Assets.assetsSplash,
                fit: BoxFit.cover,
                height: 200,
              );
            },
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Expanded(
            child: Center(
              child: Text(
                character.name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          // CharacterInfo(
          //     text: character.status, color: determineColor(character.status)),
        ],
      ),
    );
  }
}

class CharacterInfo extends StatelessWidget {
  const CharacterInfo({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}

Color determineColor(String status) {
  return switch (status) {
    'Alive' => const Color.fromARGB(255, 109, 243, 113),
    'Dead' => const Color.fromARGB(255, 239, 81, 81),
    'Female' => const Color.fromARGB(255, 245, 133, 213),
    'Male' => const Color.fromARGB(255, 116, 135, 243),
    _ => const Color.fromARGB(255, 159, 161, 159)
  };
}
