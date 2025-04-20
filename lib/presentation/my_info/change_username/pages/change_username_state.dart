import 'package:jogak_jogak/core/module/state/base_state.dart';

class ChangeUsernameState {
  final BaseState state;
  final bool? isAbleUsername;

  const ChangeUsernameState({this.state = BaseState.init, this.isAbleUsername});

  ChangeUsernameState copyWith({BaseState? state, bool? isAbleUsername}) {
    return ChangeUsernameState(
      state: state ?? this.state,
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
    );
  }
}
