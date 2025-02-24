import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';
import 'package:rick_and_morty_app/core/responsive/size_provider.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';
import 'package:rick_and_morty_app/core/utils/app_constants.dart';
import 'package:rick_and_morty_app/features/characters/model/characters_model.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/widgets/character_info_builder.dart';
import 'package:rick_and_morty_app/features/character_details/presentation/widgets/custom_sliver_app_bar.dart';

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({super.key, required this.character});
  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> characterInfo = [
      {
        label: 'Status: ',
        value: character.status,
        indent: 0.80,
      },
      {
        label: 'Kind: ',
        value: character.kind,
        indent: 0.83,
      },
      {
        label: 'Gender: ',
        value: character.gender,
        indent: 0.79,
      },
      character.type == null || character.type!.isEmpty
          ? {}
          : {
              label: 'Type: ',
              value: character.type,
              indent: 0.83,
            },
      {
        label: 'Origin: ',
        value: character.origin.name,
        indent: 0.81,
      },
      {
        label: 'Current Location: ',
        value: character.location.name,
        indent: 0.64,
      }
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SizeProvider(
          baseSize: const Size(360, 490),
          width: context.setMinSize(360),
          height: context.setMinSize(490),
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  CustomSliverAppBar(character: character),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        top: context.setMinSize(30),
                        left: context.setMinSize(5)),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        'Character Information: ',
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: context.setMinSize(16),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                        left: context.setMinSize(30),
                        top: context.setMinSize(10)),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var info = characterInfo[index];
                          return info.isEmpty
                              ? Container()
                              : CharacterInfoBuilder(info[label], info[value],
                                  context, info[indent]);
                        },
                        childCount: characterInfo.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: context.screenHeight * 0.8),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
