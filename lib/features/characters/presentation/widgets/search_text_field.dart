import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/manager/characters_cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/characters/data/model/characters_model.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.allCharactersList});
  final List<CharactersModel> allCharactersList;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: context.read<CharactersCubit>().txtController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a character....',
          hintStyle: TextStyle(
            color: AppColors.searchColor,
            fontSize: context.setMinSize(12),
          ),
          contentPadding: EdgeInsets.only(left: context.setMinSize(10)),
        ),
        cursorColor: AppColors.searchColor,
        cursorHeight: context.setMinSize(15),
        style: TextStyle(
          color: AppColors.searchColor,
          fontSize: context.setMinSize(12),
        ),
      ),
    );
  }
}
