import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/functions/size_functions.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_info_builder.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/custom_sliver_app_bar.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> characterInfo = [
      {
        label: 'Status: ',
        value: character.status,
        indent: 0.86,
      },
      {
        label: 'Kind: ',
        value: character.kind,
        indent: 0.89,
      },
      {
        label: 'Gender: ',
        value: character.gender,
        indent: 0.85,
      },
      character.type == null || character.type!.isEmpty
          ? {}
          : {
              label: 'Type: ',
              value: character.type,
              indent: 0.89,
            },
      {
        label: 'Origin: ',
        value: character.origin.name,
        indent: 0.87,
      },
      {
        label: 'Current Location: ',
        value: character.location.name,
        indent: 0.7,
      }
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(character: character),
            const SliverPadding(
              padding: EdgeInsets.only(top: 50, left: 5),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Character Information: ',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var info = characterInfo[index];
                    return info.isEmpty
                        ? Container()
                        : CharacterInfoBuilder(info['label'], info['value'],
                            context, info['indent']);
                  },
                  childCount: characterInfo.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: sizeSetterHeight(context, 0.8)),
            )
          ],
        ),
      ),
    );
  }
}
