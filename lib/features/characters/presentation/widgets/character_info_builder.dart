import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/responsive/size_detection_helper.dart';

class CharacterInfoBuilder extends StatelessWidget {
  const CharacterInfoBuilder(this.title, this.info, this.context, this.indent,
      {super.key});
  final String title;
  final String info;
  final BuildContext context;
  final double indent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          maxLines: 1,
          text: TextSpan(
            children: [
              TextSpan(
                text: title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: context.setMinSize(14),
                ),
              ),
              TextSpan(
                text: info,
                style: TextStyle(
                    color: Colors.white, fontSize: context.setMinSize(12)),
              )
            ],
          ),
        ),
        Divider(endIndent: context.screenWidth * indent, color: Colors.yellow)
      ],
    );
  }
}
