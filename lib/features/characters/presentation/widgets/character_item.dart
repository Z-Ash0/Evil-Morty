import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/characters/data/model/characters_model.dart';
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
        //* Using LayOutBuilder to get the size of its child
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizeProvider(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              baseSize: const Size(200, 400),
              child: Builder(builder: (context) {
                return Card(
                  elevation: 15,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      CachedImage(
                          image: character.image,
                          height: context.sizeProvider.height * 0.8),
                      Expanded(
                        child: Center(
                          child: Text(
                            character.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: context.setMinSize(30),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
