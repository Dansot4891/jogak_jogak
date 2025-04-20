import 'package:jogak_jogak/core/module/state/base_state.dart';

class ChangeUsernameState {
  final bool? isAbleUsername;

  const ChangeUsernameState({this.isAbleUsername});

  ChangeUsernameState copyWith({bool? isAbleUsername}) {
    return ChangeUsernameState(
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
    );
  }
}
