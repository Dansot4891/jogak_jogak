import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignInState {
  final BaseState state;

  const SignInState({this.state = BaseState.init});

  SignInState copyWith({BaseState? state}) {
    return SignInState(state: state ?? this.state);
  }
}
