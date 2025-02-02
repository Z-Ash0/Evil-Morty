import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            character.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        child: character.image.isNotEmpty
            ? FadeInImage.assetNetwork(
                image: character.image,
                placeholder: Assets.assetsLoadingIndicator,
                fit: BoxFit.contain,
              )
            : Image.asset(Assets.assetsSplash),
      ),
    );
  }
}
