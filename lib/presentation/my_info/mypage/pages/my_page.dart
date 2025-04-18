import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/app/style/app_color.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/util/dialog/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/widgets/setting_card.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      isScaffold: false,
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
                  SettingCard(
                    text: '비밀번호 변경',
                    onTap: () {
                      navigate(context, route: AppRoute.changePw);
                    },
                  ),
                  SettingCard(
                    text: '닉네임 변경',
                    onTap: () {
                      navigate(context, route: AppRoute.updateName);
                    },
                  ),
                  SettingCard(
                    text: '퍼즐 기록',
                    onTap: () {
                      navigate(context, route: AppRoute.puzzleHistory);
                    },
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  SettingCard(
                    text: '로그아웃',
                    onTap: () {
                      AppShowDialog.show(
                        context,
                        AppDialog(
                          title: '로그아웃',
                          subText: '로그아웃 하시겠습니까?',
                          btnText: '취소',
                          btnLeftText: '확인',
                          onBtnLeftClicked: () {},
                          onBtnClicked: () {},
                        ),
                      );
                    },
                  ),
                  SettingCard(
                    text: '회원탈퇴',
                    onTap: () {
                      AppShowDialog.show(
                        context,
                        AppDialog(
                          title: '회원탈퇴',
                          subText: '회원탈퇴 하시겠습니까?',
                          btnText: '취소',
                          btnLeftText: '확인',
                          onBtnLeftClicked: () {},
                          onBtnClicked: () {},
                        ),
                      );
                    },
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
