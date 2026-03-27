import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({super.key, required this.initialLabelIndex, required this.onToggle,required this.customWidgets});

  final int initialLabelIndex;
  final void Function(int?) onToggle;
  final List<Widget>? customWidgets;

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 73.0,
      minHeight: 30.0,
      initialLabelIndex: initialLabelIndex,
      cornerRadius: 20.0,
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      customWidgets: customWidgets,
      activeBgColors: [[AppColors.primaryColorLight], [AppColors.primaryColorLight]],
      animate: true,
      curve: Curves.easeInOut,
      onToggle: onToggle,
    );
  }
}