import 'dart:async';
import 'package:flutter/foundation.dart';
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
    _deleteUserUseCase.execute(email: email, password: password);
  }
}
