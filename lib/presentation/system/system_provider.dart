import 'package:jogak_jogak/feature/system/domain/use_case/check_version_use_case.dart';
import 'package:jogak_jogak/feature/system/domain/use_case/get_version_use_case.dart';

class SystemProvider {
  final CheckVersionUseCase _checkVersionUseCase;
  final GetVersionUseCase _getVersionUseCase;

  SystemProvider({
    required CheckVersionUseCase checkVersionUseCase,
    required GetVersionUseCase getVersionUseCase,
  }) : _checkVersionUseCase = checkVersionUseCase,
       _getVersionUseCase = getVersionUseCase;
}
