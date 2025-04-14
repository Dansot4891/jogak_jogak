import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/home/pages/home_view_model.dart';

class LevelButton extends StatelessWidget {
  final HomeViewModel viewModel;
  final int level;
  const LevelButton({required this.viewModel, required this.level, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppButton(
        text: '$level X $level',
        bgColor: viewModel.state.level != level ? _levelButtonColor : null,
        onTap: () {
          viewModel.selectLevel(level);
        },
      ),
    );
  }

  static final Color _levelButtonColor = AppColor.greyA7;
}
