import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/module/state/state_handling.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/base/pages/base_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/notice/username_notice.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_view_model.dart';

class ChangeUsernamePage extends StatefulWidget {
  final ChangeUsernameViewModel viewModel;
  const ChangeUsernamePage(this.viewModel, {super.key});

  @override
  State<ChangeUsernamePage> createState() => _ChangeUsernamePageState();
}

class _ChangeUsernamePageState extends State<ChangeUsernamePage> {
  late ChangeUsernameViewModel viewModel;
  final _username = TextEditingController();

  @override
  void initState() {
    viewModel = widget.viewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: const DefaultAppbar(title: '닉네임 변경'),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return StateHandling(
            state: viewModel.state.state,
            init: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _username,
                          hintText: '새로운 닉네임',
                          maxLength: 10,
                          onChanged: (val) {
                            viewModel.resetIsAbleUsername();
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      AppButton(
                        text: '중복확인',
                        horizontalPadding: 8,
                        onTap:
                            isEmpty
                                ? null
                                : () {
                                  viewModel.checkUsername(_username.text);
                                },
                      ),
                    ],
                  ),
                  UsernameNotice(viewModel.state.isAbleUsername),
                  AppButton(
                    text: '닉네임 변경',
                    onTap:
                        viewModel.state.isAbleUsername == true
                            ? () {
                              viewModel.changeUsername(_username.text);
                            }
                            : null,
                  ),
                ],
              ),
            ),
            loading: const BaseLoadingView(),
            error: BaseErrorView(viewModel.state.errorMessage),
            success: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImage.clear,
                    width: AppSize.fractionWidth(0.3),
                  ),
                  const SizedBox(height: 20),
                  Text('닉네임 변경이 완료되었습니다.', style: AppTextStyle.title2),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool get isEmpty => _username.text.isEmpty;
}
