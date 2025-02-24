import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.character});

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
      surfaceTintColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: context.setMinSize(8)),
          decoration: BoxDecoration(
            color: AppColors.bgColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            character.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.setMinSize(16),
            ),
          ),
        ),
      ),
      expandedHeight: context.screenHeight * 0.6,
    );
  }
}
