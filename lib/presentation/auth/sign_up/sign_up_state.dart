import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignupState {
  final BaseState state;
  final bool? isAbleUsername;
  SignupState({this.state = BaseState.init, this.isAbleUsername});

  SignupState copyWith({BaseState? state, bool? isAbleUsername}) {
    return SignupState(
      state: state ?? this.state,
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
    );
  }
}
