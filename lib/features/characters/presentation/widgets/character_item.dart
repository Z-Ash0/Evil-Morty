import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/cached_image.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).pushNamed(detailsScreen, arguments: character),
      child: Hero(
        tag: character.id,
        child: Card(
          elevation: 15,
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              CachedImage(image: character.image),
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
