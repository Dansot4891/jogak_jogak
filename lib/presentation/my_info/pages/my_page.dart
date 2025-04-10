import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/my_info/widgets/setting_card.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      isScaffold: true,
      minusHeight: AppSize.bottomNaviationHeight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  const Icon(Icons.extension_outlined, size: 120),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text('임명우님\n환영합니다.', style: AppTextStyle.title2),
                  ),
                  SettingCard(text: '비밀번호 변경', onTap: () {}),
                  SettingCard(text: '닉네임 변경', onTap: () {}),
                  SettingCard(text: '퍼즐 기록', onTap: () {}),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Spacer(),
                  SettingCard(text: '로그아웃', onTap: () {}),
                  SettingCard(
                    text: '회원탈퇴',
                    onTap: () {},
                    baseColor: AppColor.greyC5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('ver 1.0.0', style: AppTextStyle.version),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
