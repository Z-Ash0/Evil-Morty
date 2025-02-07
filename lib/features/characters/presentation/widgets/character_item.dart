import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Hero(
        tag: character.id,
        child: Card(
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
            ],
          ),
        ),
      ),
    );
  }
}
