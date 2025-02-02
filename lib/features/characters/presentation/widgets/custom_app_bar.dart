import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_assets.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(Assets.assetsAppBar, width: 150),
        const CustomIconButton(icon: Icon(Icons.search)),
      ],
    );
  }
}
