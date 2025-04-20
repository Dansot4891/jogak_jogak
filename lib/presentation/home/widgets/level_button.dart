import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';

class LevelButton extends StatelessWidget {
  final int selectedLevel;
  final int level;
  final double horizontalMargin;
  final VoidCallback onTap;
  const LevelButton({
    required this.selectedLevel,
    required this.level,
    required this.onTap,
    this.horizontalMargin = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        text: '$level X $level',
        bgColor: selectedLevel != level ? _levelButtonColor : null,
        horizontalMargin: horizontalMargin,
        onTap: onTap,
      ),
    );
  }

  static final Color _levelButtonColor = AppColor.greyA7;
}
