import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key, required this.icon, required this.onPressed,
  });
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: BoxBorder.all(
            color: AppColors.primaryColorLight,
            width: 2
        ),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          color: AppColors.primaryColorLight,
          icon,
        ),
      ),
    );
  }
}