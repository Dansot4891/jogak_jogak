import 'package:jogak_jogak/core/module/state/base_state.dart';

class MyPageState {
  final String username;
  final String version;
  final BaseState state;
  final String errorMessage;
  MyPageState({
    this.username = '',
    this.version = '',
    this.state = BaseState.init,
    this.errorMessage = '',
  });

  MyPageState copyWith({
    String? username,
    String? version,
    BaseState? state,
    String? errorMessage,
  }) {
    return MyPageState(
      username: username ?? this.username,
      version: version ?? this.version,
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
