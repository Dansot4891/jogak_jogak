import 'package:jogak_jogak/core/module/error_handling/result.dart';
import 'package:jogak_jogak/core/module/exception/custom_exception.dart';
import 'package:jogak_jogak/feature/system/domain/model/app_version.dart';
import 'package:jogak_jogak/feature/system/domain/repository/system_repository.dart';

class GetVersionUseCase {
  final SystemRepository _systemRepository;

  GetVersionUseCase(this._systemRepository);

  Future<Result<AppVersion>> execute() async {
    try {
      final version = AppVersion(await _systemRepository.getDeviceVersion());
      return Result.success(version);
    } catch (e) {
      return const Result.error(VersionException());
    }
  }
}
