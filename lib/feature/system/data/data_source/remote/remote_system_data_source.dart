import 'package:jogak_jogak/feature/system/data/dto/store_version_dto.dart';

abstract interface class RemoteSystemDataSource {
  Future<StoreVersionDto> getStoreVersion();
}
