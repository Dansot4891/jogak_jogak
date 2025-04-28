import 'package:jogak_jogak/feature/system/domain/model/store_version.dart';

abstract interface class SystemRepository {
  Future<String> getDeviceVersion();

  Future<StoreVersion> getStoreVersion();
}
