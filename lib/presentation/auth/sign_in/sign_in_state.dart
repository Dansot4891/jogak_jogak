import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignInState {
  final BaseState state;
  final String errorMessage;
  SignInState({this.state = BaseState.init, this.errorMessage = ''});

  SignInState copyWith({BaseState? state, String? errorMessage}) {
    return SignInState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
