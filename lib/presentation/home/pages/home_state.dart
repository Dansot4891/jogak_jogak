// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:jogak_jogak/core/module/state/base_state.dart';

class HomeState {
  final int level;
  final File? file;
  final BaseState state;
  final String error;

  const HomeState({
    this.level = 3,
    this.file,
    // 에러 났을 때만 ui가 변동된다.
    // 기본값은 success
    this.state = BaseState.success,
    this.error = '',
  });

  HomeState copyWith({
    int? level,
    File? file,
    bool fileClear = false,
    BaseState? state,
    String? error,
  }) {
    return HomeState(
      level: level ?? this.level,
      file: fileClear ? null : file ?? this.file,
      state: state ?? this.state,
      error: error ?? this.error,
    );
  }
}
