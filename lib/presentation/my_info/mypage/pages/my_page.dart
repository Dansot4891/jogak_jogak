import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
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
                    '${state.username()} ${LocaleKeys.myPageSir.tr()}\n${LocaleKeys.myPageWelcome.tr()}',
                    style: AppTextStyle.title2,
                  ),
                ),
                SettingCard(
                  text: LocaleKeys.resetPassword.tr(),
                  onTap: () {
                    navigate(context, route: AppRoute.changePw);
                  },
                ),
                SettingCard(
                  text: LocaleKeys.changeUsername.tr(),
                  onTap: () {
                    navigate(context, route: AppRoute.changeUsername);
                  },
                ),
                SettingCard(
                  text: LocaleKeys.myPagePuzzleRecord.tr(),
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
                  text: LocaleKeys.logout.tr(),
                  onTap: () {
                    AppShowDialog.show(
                      context,
                      AppDialog(
                        title: LocaleKeys.logout.tr(),
                        subText: LocaleKeys.myPageConfirmLogout.tr(),
                        btnText: LocaleKeys.ok.tr(),
                        btnLeftText: LocaleKeys.cancel.tr(),
                        onBtnLeftClicked: () {
                          pop(context);
                        },
                        onBtnClicked: () {
                          onAction(const MyPageAction.signout());
                        },
                      ),
                    );
                  },
                ),
                SettingCard(
                  text: LocaleKeys.withdrawal.tr(),
                  onTap: () {
                    navigate(context, route: AppRoute.deleteUser);
                  },
                  baseColor: AppColor.greyC5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'ver ${state.version}',
                    style: AppTextStyle.version,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
