import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/feature/user/domain/use_case/check_username_use_case.dart';
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

  void checkUsername(String username) async {
    final result = await _checkUsernameUseCase.execute(username);
    switch (result) {
      case Success<bool>():
        _state = state.copyWith(isAbleUsername: result.data);
        notifyListeners();
      case Error<bool>():
    }
  }

  Future<String> changeUsername(String username) async {
    final result = await _userProvider.changeUsername(username);
    switch (result) {
      case Success<void>():
        return '닉네임이 변경되었습니다.';
      case Error<void>():
        return '닉네임 변경에 실패하였습니다.';
    }
  }
}
