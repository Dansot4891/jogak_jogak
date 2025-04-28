import 'package:jogak_jogak/core/module/state/base_state.dart';

class SystemState {
  final BaseState state;
  final String errorMessage;
  final String version;
  SystemState({
    this.state = BaseState.init,
    this.errorMessage = '',
    this.version = '',
  });

  SystemState copyWith({
    BaseState? state,
    String? errorMessage,
    String? version,
  }) {
    return SystemState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
      version: version ?? this.version,
    );
  }
}
