import 'package:jogak_jogak/core/module/state/base_state.dart';

class ChangePasswordState {
  final BaseState state;
  final String errorMessage;

  const ChangePasswordState({
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  ChangePasswordState copyWith({BaseState? state, String? errorMessage}) {
    return ChangePasswordState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
