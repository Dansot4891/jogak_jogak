import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/state/base_state.dart';
import 'package:jogak_jogak/feature/system/domain/model/app_version.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/check_version_use_case.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/get_version_use_case.dart';
import 'package:jogak_jogak/presentation/system/system_state.dart';

class SystemProvider with ChangeNotifier {
  final CheckVersionUseCase _checkVersionUseCase;
  final GetVersionUseCase _getVersionUseCase;

  SystemProvider({
    required CheckVersionUseCase checkVersionUseCase,
    required GetVersionUseCase getVersionUseCase,
  }) : _checkVersionUseCase = checkVersionUseCase,
       _getVersionUseCase = getVersionUseCase;

  SystemState _state = SystemState();
  SystemState get state => _state;

  Future<Result<bool>> checkVersion() async {
    return await _checkVersionUseCase.execute();
  }

  void getDeviceVersion() async {
    final result = await _getVersionUseCase.execute();
    switch (result) {
      case Success<AppVersion>():
        _state = state.copyWith(
          version: result.data.version,
          state: BaseState.success,
        );
      case Error<AppVersion>():
        _state = state.copyWith(
          errorMessage: result.error.message,
          state: BaseState.error,
        );
    }
  }
}
