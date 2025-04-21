import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:jogak_jogak/app/di/app_di.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  late UserProvider provider;

  @override
  void initState() {
    _initialization();
    super.initState();
  }

  void _initialization() async {
    provider = locator();
    await provider.autoLogin();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppSize.fractionHeight(0.11)),
              Image.asset(AppImage.appLogo, width: AppSize.fractionWidth(0.6)),
              const SizedBox(height: 20),
              Text('조각조각', style: AppTextStyle.title1),
              const SizedBox(height: 40),
              CustomTextFormField(controller: _email, hintText: '이메일 입력'),
              const SizedBox(height: 8),
              CustomTextFormField(
                controller: _password,
                obsecure: true,
                maxLines: 1,
                hintText: '비밀번호 입력',
              ),
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
                        navigate(context, route: AppRoute.changePw);
                      },
                      child: Text('비밀번호 재설정', style: AppTextStyle.body1),
                    ),
                  ],
                ),
              ),
              AppButton(
                text: '로그인',
                onTap: () async {
                  final result = await provider.signIn(
                    email: _email.text,
                    password: _password.text,
                  );
                  if (!result) {
                    if (mounted) {
                      AppShowDialog.show(
                        context,
                        AppDialog.singleBtn(
                          title: '로그인에 실패하였습니다.',
                          btnText: '확인',
                          onBtnClicked: () {
                            pop(context);
                          },
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
