import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/cubit/characters_state.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/custom_app_bar.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getCharactersFromRepo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomAppBar(),
              Center(
                  child: Image.asset(Assets.assetsHomePage,
                      width: 400, height: 400, fit: BoxFit.cover)),
              blocWidget(),
            ],
          )),
        ),
      ),
    );
  }
}

Widget blocWidget() {
  List<CharactersModel> allCharacters;
  return BlocBuilder<CharactersCubit, CharactersState>(
    builder: (context, state) {
      if (state is AllCharactersLoading) {
        return Center(
            child:
                Image.asset(Assets.assetsLoadingRick, width: 300, height: 300));
      } else if (state is AllCharactersLoaded) {
        allCharacters = state.charactersList;
        return buildCharacterItems(allCharacters);
      } else {
        return const SizedBox.shrink();
      }
    },
  );
}

Widget buildCharacterItems(List<CharactersModel> characters) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2 / 3,
      crossAxisSpacing: 20,
    ),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) =>
        CharacterItem(character: characters[index]),
    itemCount: characters.length,
  );
}
