import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        onPressed: () {},
        icon: icon,
        color: AppColors.primaryColor,
      ),
    );
  }
}
