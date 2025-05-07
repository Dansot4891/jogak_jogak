// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';

class MyPageState {
  final AppUser? user;
  final String version;
  final BaseState state;
  final String errorMessage;
  MyPageState({
    this.user,
    this.version = '',
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  MyPageState copyWith({
    AppUser? user,
    String? version,
    BaseState? state,
    String? errorMessage,
  }) {
    return MyPageState(
      user: user ?? this.user,
      version: version ?? this.version,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  // 유저 닉네임 할당
  String username() {
    final pUser = user as CertifiedUser;
    return pUser.username;
  }
}
