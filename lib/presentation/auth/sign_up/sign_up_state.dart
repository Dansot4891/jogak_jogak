import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignupState {
  final BaseState state;
  final bool? isAbleUsername;
  final String errorMessage;
  SignupState({
    this.state = BaseState.init,
    this.isAbleUsername,
    this.errorMessage = '',
  });

  SignupState copyWith({
    BaseState? state,
    bool? isAbleUsername,
    String? errorMessage,
  }) {
    return SignupState(
      state: state ?? this.state,
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
