import 'package:flutter/material.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';

class StateHandling extends StatelessWidget {
  final BaseState state;
  final Widget init;
  final Widget loading;
  final Widget error;
  final Widget success;
  const StateHandling({
    super.key,
    required this.state,
    required this.init,
    required this.loading,
    required this.error,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case BaseState.init:
        return init;
      case BaseState.loading:
        return loading;
      case BaseState.success:
        return success;
      case BaseState.error:
        return error;
    }
  }
}
