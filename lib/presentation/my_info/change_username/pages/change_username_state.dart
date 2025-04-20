import 'package:jogak_jogak/core/module/state/base_state.dart';

class ChangeUsernameState {
  final BaseState state;
  final bool? isAbleUsername;
  final String errorMessage;

  const ChangeUsernameState({
    this.state = BaseState.init,
    this.isAbleUsername,
    this.errorMessage = '',
  });

  ChangeUsernameState copyWith({
    BaseState? state,
    bool? isAbleUsername,
    String? errorMessage,
  }) {
    return ChangeUsernameState(
      state: state ?? this.state,
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
