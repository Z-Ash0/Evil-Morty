import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/functions/size_functions.dart';

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
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 28),
              ),
              TextSpan(
                  text: info,
                  style: const TextStyle(color: Colors.white, fontSize: 24))
            ],
          ),
        ),
        Divider(
            endIndent: sizeSetterWidth(context, indent), color: Colors.yellow)
      ],
    );
  }
}
