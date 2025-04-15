import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/user/data/model/user.dart';

class UserState {
  final BaseState state;
  final AppUser? user;

  const UserState({this.state = BaseState.init, this.user});

  UserState copyWith({BaseState? state, AppUser? user}) {
    return UserState(state: state ?? this.state, user: user ?? this.user);
  }
}
