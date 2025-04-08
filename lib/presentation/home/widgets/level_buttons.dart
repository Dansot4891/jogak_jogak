import 'package:flutter/material.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';

class LevelButtons extends StatelessWidget {
  const LevelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: AppButton(text: '3 X 3', onTap: () {})),
        const SizedBox(width: 8),
        Expanded(child: AppButton(text: '4 X 4', onTap: () {})),
        const SizedBox(width: 8),
        Expanded(child: AppButton(text: '5 X 5', onTap: () {})),
      ],
    );
  }
}
