import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/core/style/app_color.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/widgets/setting_card.dart';

class MyPage extends StatelessWidget {
  final MyPageState state;
  final void Function(MyPageAction action) onAction;
  const MyPage({required this.state, required this.onAction, super.key});

  @override
  Widget build(BuildContext context) {
    if (state.state == BaseState.error) {
      return BaseErrorView(state.errorMessage);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  AppImage.appLogoWithColor,
                  width: AppSize.fractionWidth(0.4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    '${state.username}님\n환영합니다.',
                    style: AppTextStyle.title2,
                  ),
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
                    navigate(context, route: AppRoute.changeUsername);
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
                        btnText: '확인',
                        btnLeftText: '취소',
                        onBtnLeftClicked: () {
                          pop(context);
                        },
                        onBtnClicked: () {
                          onAction(const MyPageAction.signout());
                          pop(context);
                        },
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
                        btnText: '확인',
                        btnLeftText: '취소',
                        onBtnLeftClicked: () {
                          pop(context);
                        },
                        onBtnClicked: () {
                          onAction(const MyPageAction.withdrawal());
                        },
                      ),
                    );
                  },
                  baseColor: AppColor.greyC5,
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Text(state.version, style: AppTextStyle.version),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
