import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignUpState {
  final BaseState state;
  const SignUpState({this.state = BaseState.init});

  SignUpState copyWith({BaseState? state}) {
    return SignUpState(state: state ?? this.state);
  }
}
