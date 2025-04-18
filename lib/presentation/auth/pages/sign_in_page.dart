import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/router.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/util/dialog/app_show_dialog.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      resizeToAvoidBottomInset: true,
      isScaffold: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.local_pizza_outlined, size: 160),
            Text('조각조각', style: AppTextStyle.title1),
            const SizedBox(height: 12),
            CustomTextFormField(controller: _email, hintText: '이메일 입력'),
            const SizedBox(height: 8),
            CustomTextFormField(controller: _password, hintText: '비밀번호 입력'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      navigate(context, route: AppRoute.signUp);
                    },
                    child: Text('회원가입', style: AppTextStyle.body1),
                  ),
                  TextButton(
                    onPressed: () {
                      AppShowDialog.show(
                        context,
                        AppDialog.doubleBtns(
                          title: '비밀번호 재설정',
                          subText: '가입하신 이메일로\n비밀번호 재설정 메일이 전송됩니다.',
                          btnLeftText: '확인',
                          btnRightText: '취소',
                          onBtnLeftClicked: () {},
                          onBtnRightClicked: () {},
                        ),
                      );
                    },
                    child: Text('비밀번호 재설정', style: AppTextStyle.body1),
                  ),
                ],
              ),
            ),
            AppButton(
              text: '로그인',
              onTap: () {
                navigate(
                  context,
                  route: AppRoute.root,
                  method: NavigationMethod.go,
                );
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
