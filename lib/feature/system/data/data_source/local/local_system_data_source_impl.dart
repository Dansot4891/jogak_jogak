import 'package:jogak_jogak/feature/system/data/data_source/local/local_system_data_source.dart';
import 'package:package_info_plus/package_info_plus.dart';

class LocalSystemDataSourceImpl implements LocalSystemDataSource {
  @override
  Future<String> getDeviceAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final version = packageInfo.version;
    return version;
  }
}
