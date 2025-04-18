// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:jogak_jogak/core/module/state/base_state.dart';

class SignUpState {
  final bool isAbleUsername;
  final bool isRightPassword;
  final BaseState state;
  const SignUpState({
    this.isAbleUsername = false,
    this.isRightPassword = false,
    this.state = BaseState.success,
  });

  SignUpState copyWith({
    bool? isAbleUsername,
    bool? isRightPassword,
    BaseState? state,
  }) {
    return SignUpState(
      isAbleUsername: isAbleUsername ?? this.isAbleUsername,
      isRightPassword: isRightPassword ?? this.isRightPassword,
      state: state ?? this.state,
    );
  }
}
