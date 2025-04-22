import 'package:flutter/material.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/style/app_text_style.dart';
import 'package:jogak_jogak/core/constants/app_image.dart';
import 'package:jogak_jogak/core/helper/validator/app_validator.dart';
import 'package:jogak_jogak/core/helper/dialog_service/app_show_dialog.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/core/module/state/base_state_view.dart';
import 'package:jogak_jogak/core/service/app_size.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_page.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/pages/sign_up_view_model.dart';
import 'package:jogak_jogak/presentation/auth/sign_up/widgets/sign_up_complete.dart';
import 'package:jogak_jogak/presentation/base/pages/bouncing_boxes_page.dart';
import 'package:jogak_jogak/presentation/base/widgets/appbar/default_appbar.dart';
import 'package:jogak_jogak/presentation/base/widgets/button/app_button.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/base/widgets/notice/username_notice.dart';
import 'package:jogak_jogak/presentation/base/widgets/text_field/text_field.dart';

class SignUpPageRoot extends StatefulWidget {
  final SignUpViewModel viewModel;
  const SignUpPageRoot(this.viewModel, {super.key});

  @override
  State<SignUpPageRoot> createState() => _SignUpPageRootState();
}

class _SignUpPageRootState extends State<SignUpPageRoot> {
  late SignUpViewModel viewModel;
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();

  @override
  void initState() {
    viewModel = widget.viewModel;
    AppShowDialog.show(
      context,
      AppDialog.singleBtn(
        title: viewModel.state.errorMessage,
        btnText: '확인',
        onBtnClicked: () {
          pop(context);
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BouncingBoxesBackground(
      appBar: const DefaultAppbar(),
      resizeToAvoidBottomInset: true,
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) {
          return SignUpPage(
            state: viewModel.state,
            onAction: viewModel.onAction,
          );
        },
      ),
    );
  }
}
