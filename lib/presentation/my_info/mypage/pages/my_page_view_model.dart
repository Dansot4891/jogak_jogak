import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class MyPageViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  MyPageViewModel(this._userProvider) {
    _state = state.copyWith(
      username: _userProvider.state.user?.username,
      state: BaseState.success,
    );
  }

  MyPageState _state = MyPageState();
  MyPageState get state => _state;

  // void signout() {
  //   _userProvider
  // }
}
