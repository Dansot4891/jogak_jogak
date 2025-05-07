import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';

class UserState {
  final BaseState state;
  final CertifiedUser? user;
  final String error;

  const UserState({this.state = BaseState.init, this.user, this.error = ''});

  UserState copyWith({BaseState? state, CertifiedUser? user, String? error}) {
    return UserState(
      state: state ?? this.state,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }

  // 유저 상태를 null로 변환
  UserState resetUser() {
    return UserState(state: state, user: null, error: error);
  }
}
