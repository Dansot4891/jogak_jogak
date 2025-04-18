import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';

class HomeError extends StatelessWidget {
  final String message;
  final VoidCallback onTap;
  const HomeError({required this.message, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: AppTextStyle.body1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
            child: AppButton(text: '돌아가기', onTap: onTap),
          ),
        ],
      ),
    );
  }
}
