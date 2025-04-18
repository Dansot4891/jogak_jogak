import 'package:jogak_jogak/core/module/state/base_state.dart';

class MyPageState {
  final String username;
  final String version;
  final BaseState state;
  MyPageState({
    this.username = '',
    this.version = 'ver 1.0.0',
    this.state = BaseState.init,
  });

  MyPageState copyWith({String? username, String? version, BaseState? state}) {
    return MyPageState(
      username: username ?? this.username,
      version: version ?? this.version,
      state: state ?? this.state,
    );
  }
}
