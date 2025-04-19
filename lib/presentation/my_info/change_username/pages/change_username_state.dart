import 'package:jogak_jogak/core/module/state/base_state.dart';

class ChangeUsernameState {
  final BaseState state;
  final String errorMessage;
  final bool? isAbleUsername;

  const ChangeUsernameState({
    this.state = BaseState.init,
    this.errorMessage = '',
    this.isAbleUsername,
  });

  ChangeUsernameState copyWith({
    BaseState? state,
    String? errorMessage,
    bool? isAbleUsername,
  }) {
    return ChangeUsernameState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
    );
  }
}
