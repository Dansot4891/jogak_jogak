import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/change_password_use_case.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/delete_user_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_event.dart';
import 'package:jogak_jogak/presentation/my_info/change_password/pages/change_password_state.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_action.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_event.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class DeleteUserViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  final DeleteUserUseCase _deleteUserUseCase;

  DeleteUserViewModel({
    required UserProvider userProvider,
    required DeleteUserUseCase deleteUserUseCase,
  }) : _userProvider = userProvider,
       _deleteUserUseCase = deleteUserUseCase;

  final DeleteUserState _state = const DeleteUserState();
  DeleteUserState get state => _state;

  final _streamController = StreamController<DeleteUserEvent>();
  Stream<DeleteUserEvent> get eventStream => _streamController.stream;

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
    final user = _userProvider.state.user as CertifiedUser;
    _deleteUserUseCase.execute(email: user.email, password: password);
  }
}
