import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/custom_icon_button.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/search_text_field.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.allCharacters});
  final List<CharactersModel> allCharacters;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isSearching = false;

  void toSearchTap() {
    //* It's like navigation to another page partially inside the same page
    // ModalRoute.of(context)!
    //     .addLocalHistoryEntry(LocalHistoryEntry(onRemove: toStopSearching));
    setState(() => isSearching = true);
  }

  void toStopSearching() {
    setState(() => isSearching = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: context.setMinSize(10), bottom: context.setMinSize(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.sizeProvider.width * 0.1),
            child: Image.asset(Assets.assetsAppBar,
                width: context.sizeProvider.width * 0.25),
          ),
          SizeProvider(
            baseSize: const Size(490, 360),
            width: context.setMinSize(490),
            height: context.setMinSize(360),
            child: Builder(
              builder: (context) {
                return actionButton();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget actionButton() {
    if (!isSearching) {
      return CustomIconButton(
        icon: Icon(Icons.search, size: context.setMinSize(16)),
        onTapped: toSearchTap,
      );
    } else {
      return Expanded(
        child: Row(
          children: [
            Expanded(
                child: SearchTextField(
              allCharactersList: widget.allCharacters,
            )),
            CustomIconButton(
              icon: Icon(
                Icons.clear,
                size: context.setMinSize(16),
              ),
              onTapped: () {
                //* Using the txtController from the cubit
                context.read<CharactersCubit>().txtController.clear();
                // Navigator.pop(context);
                toStopSearching();
              },
            ),
          ],
        ),
      );
    }
  }
}
