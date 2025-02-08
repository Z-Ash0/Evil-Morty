import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/functions/size_functions.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.character,
  });

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.bgColor),
        onPressed: () => Navigator.of(context).pop(),
      ),
      pinned: true,
      backgroundColor: AppColors.bgColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            character.name,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ),
      expandedHeight: sizeSetterHeight(context, 0.6),
    );
  }
}
