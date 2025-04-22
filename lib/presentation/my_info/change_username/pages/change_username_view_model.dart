import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/check_username_use_case.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_action.dart';
import 'package:jogak_jogak/presentation/my_info/change_username/pages/change_username_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class ChangeUsernameViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  final CheckUsernameUseCase _checkUsernameUseCase;

  ChangeUsernameViewModel({
    required UserProvider userProvider,
    required CheckUsernameUseCase checkUsernameUseCase,
  }) : _userProvider = userProvider,
       _checkUsernameUseCase = checkUsernameUseCase;

  ChangeUsernameState _state = const ChangeUsernameState();
  ChangeUsernameState get state => _state;

  void onAction(ChangeUsernameAction action) {
    switch (action) {
      case CheckUsername():
        _checkUsername(action.username);
      case ChangeUsername():
        _changeUsername(action.username);
      case ResetIsAbleUsername():
        _resetIsAbleUsername();
    }
  }

  void _checkUsername(String username) async {
    final result = await _checkUsernameUseCase.execute(username);
    switch (result) {
      case Success<bool>():
        _state = state.copyWith(isAbleUsername: result.data);
        notifyListeners();
      case Error<bool>():
    }
  }

  Future<void> _changeUsername(String username) async {
    _state = state.copyWith(state: BaseState.loading);
    notifyListeners();
    final result = await _userProvider.changeUsername(username);
    switch (result) {
      case Success<void>():
        _state = state.copyWith(state: BaseState.success);
      case Error<void>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: state.errorMessage,
        );
    }
    notifyListeners();
  }

  void _resetIsAbleUsername() {
    _state = state.resetIsAbleUsername();
    notifyListeners();
  }
}
