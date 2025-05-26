import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/auth/domain/use_case/delete_user_use_case.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_action.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_event.dart';
import 'package:jogak_jogak/presentation/my_info/delete_user/pages/delete_user_state.dart';

class DeleteUserViewModel with ChangeNotifier {
  final DeleteUserUseCase _deleteUserUseCase;

  DeleteUserViewModel(this._deleteUserUseCase);

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
    final result = await _deleteUserUseCase.execute(
      email: email,
      password: password,
    );
    switch (result) {
      case Success<void>():
        break;
      case Error<void>():
        _streamController.add(
          DeleteUserEvent.deleteUserShowDialog(result.error.message),
        );
    }
  }
}
