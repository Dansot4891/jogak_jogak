import 'package:flutter/material.dart';
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
  final _email = TextEditingController();

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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        controller: _email,
                        hintText: '새로운 닉네임',
                        maxLength: 10,
                        onChanged: (val) {
                          setState(() {});
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
                                viewModel.checkUsername(_email.text);
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
                            viewModel.checkUsername(_email.text);
                          }
                          : null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool get isEmpty => _email.text.isEmpty;
}
