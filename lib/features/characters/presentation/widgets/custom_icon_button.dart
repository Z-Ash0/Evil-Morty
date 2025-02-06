import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTapped,
  });
  final Icon icon;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        onPressed: onTapped,
        icon: icon,
        color: AppColors.primaryColor,
      ),
    );
  }
}
