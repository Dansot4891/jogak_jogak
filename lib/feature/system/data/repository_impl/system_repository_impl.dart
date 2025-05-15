import 'package:jogak_jogak/feature/system/data/data_source/local/local_system_data_source.dart';
import 'package:jogak_jogak/feature/system/data/data_source/remote/remote_system_data_source.dart';
import 'package:jogak_jogak/feature/system/data/mapper/store_version_mapper.dart';
import 'package:jogak_jogak/feature/system/domain/model/store_version.dart';
import 'package:jogak_jogak/feature/system/domain/repository/system_repository.dart';

class SystemRepositoryImpl implements SystemRepository {
  final LocalSystemDataSource _localSystemDataSource;
  final RemoteSystemDataSource _remoteSystemDataSource;

  SystemRepositoryImpl({
    required LocalSystemDataSource localSystemDataSource,
    required RemoteSystemDataSource remoteSystemDataSource,
  }) : _localSystemDataSource = localSystemDataSource,
       _remoteSystemDataSource = remoteSystemDataSource;

  @override
  Future<String> getDeviceVersion() async {
    final version = await _localSystemDataSource.getDeviceVersion();
    return version;
  }

  @override
  Future<StoreVersion> getStoreVersion() async {
    final version = await _remoteSystemDataSource.getStoreVersion();
    print('repo get store version: $version');
    return version.toStoreVersion();
  }
}
