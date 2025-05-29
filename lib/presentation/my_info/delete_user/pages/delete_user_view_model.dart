import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/app/router/routes.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/delete_user_use_case.dart';
import 'package:jogak_jogak/presentation/base/widgets/dialog/app_dialog.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_action.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';
import 'package:ui_event_bus/core/helper/app_event_helper.dart';

class DeleteUserViewModel with ChangeNotifier {
  final DeleteUserUseCase _deleteUserUseCase;
  final UserProvider _userProvider;

  DeleteUserViewModel({
    required DeleteUserUseCase deleteUserUseCase,
    required UserProvider userProvider,
  }) : _deleteUserUseCase = deleteUserUseCase,
       _userProvider = userProvider;

  final DeleteUserState _state = const DeleteUserState();
  DeleteUserState get state => _state;

  void onAction(DeleteUserAction action) {
    switch (action) {
      case DeleteUser():
        _deleteUser(email: action.email, password: action.password);
    }
  }

  Future<void> _deleteUser({
    required String email,
    required String password,
  }) async {
    final result = await _deleteUserUseCase.execute(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<void>():
        _userProvider.signout();
        break;
      case Error<void>():
        EventHelpers.showDialog(
          builder:
              (ctx) => AppDialog.singleBtn(
                title: LocaleKeys.error.tr(),
                btnText: LocaleKeys.ok.tr(),
                onBtnClicked: () {
                  pop(ctx);
                },
              ),
        );
    }
  }
}
