import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/domain/model/user.dart';

class UserState {
  final BaseState state;
  final AppUser? user;
  final String error;

  const UserState({this.state = BaseState.init, this.user, this.error = ''});

  UserState copyWith({BaseState? state, AppUser? user, String? error}) {
    return UserState(
      state: state ?? this.state,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
