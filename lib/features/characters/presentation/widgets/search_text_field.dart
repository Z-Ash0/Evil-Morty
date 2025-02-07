import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';

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
        color: AppColors.secondaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: context.read<CharactersCubit>().txtController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter a character....',
          hintStyle: TextStyle(color: AppColors.searchColor, fontSize: 18),
          contentPadding: const EdgeInsets.only(left: 20),
        ),
        cursorColor: AppColors.searchColor,
        cursorHeight: 20,
        style: TextStyle(color: AppColors.searchColor, fontSize: 18),
      ),
    );
  }
}
