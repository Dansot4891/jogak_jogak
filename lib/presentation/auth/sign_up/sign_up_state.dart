import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignupState {
  final BaseState state;
  SignupState({this.state = BaseState.init});

  SignupState copyWith({BaseState? state}) {
    return SignupState(state: state ?? this.state);
  }
}
