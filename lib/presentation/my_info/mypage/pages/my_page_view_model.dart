import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class MyPageViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  MyPageViewModel(this._userProvider) {
    _initialization();
  }

  MyPageState _state = MyPageState();
  MyPageState get state => _state;

  void onAction(MyPageAction action) {
    switch (action) {
      case Signout():
        _signout();
      case Withdrawal():
        _withdrawal();
    }
  }

  void _signout() {
    _userProvider.signout();
  }

  void _withdrawal() {
    _userProvider.withdrawal();
  }

  // 전역 관리하는 유저 데이터 할당
  void _initialization() async {
    if (_userProvider.state.user == null) {
      _state = state.copyWith(
        state: BaseState.error,
        errorMessage: _userProvider.state.error,
      );
    } else {
      _state = state.copyWith(
        username: _userProvider.state.user?.username,
        state: BaseState.success,
      );
    }
    notifyListeners();
  }
}
