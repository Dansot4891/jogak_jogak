import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/system/data/data_source/remote/remote_system_data_source.dart';
import 'package:jogak_jogak/feature/system/data/dto/store_version_dto.dart';

class RemoteSystemDataSourceImpl implements RemoteSystemDataSource {
  final FirebaseFirestore _instance;

  RemoteSystemDataSourceImpl(this._instance);

  @override
  Future<StoreVersionDto> getStoreVersion() async {
    final snapshot =
        await _instance.collection(FirebaseCollections.system).get();
    final versionDto = StoreVersionDto.fromFireBase(snapshot.docs[0]);
    return versionDto;
  }
}
