import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/cubit/characters_cubit.dart';
import 'package:rick_and_morty_app/core/cubit/characters_state.dart';
import 'package:rick_and_morty_app/core/responsive/device_utilities.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/custom_app_bar.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    //* The purpose of the next line is to provide the Bloc bcz as we know BlocProvider provides Bloc lazely so we should invoke it explicitly
    BlocProvider.of<CharactersCubit>(context).getCharactersFromRepo();
    //* Adding a scrolling controller to detect the max scrolling extent to demand more data chuncks from api
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          context.read<CharactersCubit>().txtController.text.isEmpty) {
        setState(() {
          BlocProvider.of<CharactersCubit>(context)
              .getCharactersFromRepo(isMore: true);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverAppBar(
              toolbarHeight: context.sizeProvider.height / 18,
              backgroundColor: AppColors.bgColor,
              surfaceTintColor: Colors.transparent,
              title: CustomAppBar(
                  allCharacters: context.read<CharactersCubit>().allCharacters),
              floating: true,
            ),
            SliverToBoxAdapter(
              child: Center(
                child: Image.asset(
                  Assets.assetsHomePage,
                  width: context.sizeProvider.height / 3.15,
                  height: context.sizeProvider.height / 3.15,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: context.setMinSize(10)),
              sliver: blocWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget blocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is AllCharactersLoading) {
          return SliverToBoxAdapter(
            child: Center(
              child: Image.asset(
                Assets.assetsLoadingRick,
                width: context.setMinSize(300),
                height: context.setMinSize(300),
              ),
            ),
          );
        } else if (state is AllCharactersLoaded) {
          context.read<CharactersCubit>().allCharacters = state.charactersList;
          return buildCharacterItems(
              context.read<CharactersCubit>().allCharacters);
        } else if (state is AllCharactersFiltered) {
          return buildCharacterItems(state.searchedCharacters);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildCharacterItems(List<CharactersModel> characters) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: DeviceUtilities.gridChildrenCount(context,
            mobileCount: 2, tabletCount: 3, desktopCount: 4),
        childAspectRatio: 2.5 / 3,
        crossAxisSpacing: context.setMinSize(10),
        mainAxisSpacing: context.setMinSize(10),
      ),
      itemBuilder: (context, index) =>
          CharacterItem(character: characters[index]),
      itemCount: characters.length,
    );
  }
}
