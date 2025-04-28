import 'package:jogak_jogak/feature/system/data/dto/store_version_dto.dart';
import 'package:jogak_jogak/feature/system/domain/model/store_version.dart';

extension StoreVersionMapper on StoreVersionDto {
  StoreVersion toStoreVersion() {
    return StoreVersion(
      playStoreVersion: playStoreVersion ?? '',
      appStoreVersion: appStoreVersion ?? '',
    );
  }
}
