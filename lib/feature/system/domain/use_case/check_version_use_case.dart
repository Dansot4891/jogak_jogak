import 'dart:io';

import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/system/domain/model/app_version.dart';
import 'package:jogak_jogak/feature/system/domain/repository/system_repository.dart';

class CheckVersionUseCase {
  final SystemRepository _systemRepository;

  CheckVersionUseCase(this._systemRepository);

  Future<Result<bool>> execute() async {
    try {
      final deviceVersion = await _systemRepository.getDeviceVersion();
      final storeVersion = await _systemRepository.getStoreVersion();
      late AppVersion appVersion;
      // 현재 플랫폼에 따라
      // 해당 플랫폼에 맞게 버전 할당
      if (Platform.isAndroid) {
        appVersion = AppVersion(storeVersion.playStoreVersion);
      } else if (Platform.isIOS) {
        appVersion = AppVersion(storeVersion.appStoreVersion);
      } else {
        return const Result.error(UnsupportedPlatformException());
      }
      if (deviceVersion == appVersion.version) {
        return const Result.success(true);
      }
      print('deviceVersion: $deviceVersion');
      print('appVersion: ${appVersion.version}');
      return const Result.error(VersionMismatchException());
    } catch (e) {
      return const Result.error(VersionException());
    }
  }
}
