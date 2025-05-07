import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/app/localization/locale_keys.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/system/domain/model/app_version.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/get_version_use_case.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_action.dart';
import 'package:jogak_jogak/presentation/my_info/mypage/pages/my_page_state.dart';
import 'package:jogak_jogak/presentation/user/provider/user_provider.dart';

class MyPageViewModel with ChangeNotifier {
  final UserProvider _userProvider;
  final GetVersionUseCase _getVersionUseCase;
  MyPageViewModel({
    required UserProvider userProvider,
    required GetVersionUseCase getVersionUseCase,
  }) : _userProvider = userProvider,
       _getVersionUseCase = getVersionUseCase {
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
  // 앱 버전 할당
  void _initialization() async {
    // 유저 정보 할당
    if (_userProvider.state.user == null) {
      _state = state.copyWith(
        state: BaseState.error,
        errorMessage: _userProvider.state.error,
      );
      return;
    } else if (_userProvider.state.user is UnCertifiedUser) {
      _state = state.copyWith(
        state: BaseState.error,
        errorMessage: LocaleKeys.myPageUnAuthMessage.tr(),
      );
      return;
    } else {
      _state = state.copyWith(
        user: _userProvider.state.user,
        state: BaseState.success,
      );
    }
    // 앱 버전 조회
    final result = await _getVersionUseCase.execute();
    switch (result) {
      case Success<AppVersion>():
        _state = state.copyWith(
          version: result.data.version,
          state: BaseState.success,
        );
      case Error<AppVersion>():
        _state = state.copyWith(
          state: BaseState.error,
          errorMessage: result.error.message,
        );
    }
    notifyListeners();
  }
}
