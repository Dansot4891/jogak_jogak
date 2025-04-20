import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';

class SignUpComplete extends StatelessWidget {
  const SignUpComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.celebration_outlined, color: AppColor.main, size: 150),
          const SizedBox(height: 20),
          Text('회원가입이 완료되었습니다!', style: AppTextStyle.header),
        ],
      ),
    );
  }
}
