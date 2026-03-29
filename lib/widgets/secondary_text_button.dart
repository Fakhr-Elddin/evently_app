import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SecondaryTextButton extends StatelessWidget {
  const SecondaryTextButton({
    super.key, required this.text, required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppStyles.boldItalic16PrimaryLight,
      ),
    );
  }
}