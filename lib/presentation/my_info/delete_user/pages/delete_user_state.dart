import 'package:jogak_jogak/core/module/state/base_state.dart';

class DeleteUserState {
  final BaseState state;
  final String errorMessage;

  const DeleteUserState({this.state = BaseState.init, this.errorMessage = ''});

  DeleteUserState copyWith({BaseState? state, String? errorMessage}) {
    return DeleteUserState(
      state: state ?? this.state,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
