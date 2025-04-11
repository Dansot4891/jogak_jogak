import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/feature/ranking/domain/model/ranking_model.dart';
import 'package:jogak_jogak/feature/ranking/domain/data_source/remote/ranking_remote_data_source.dart';

class RankingRemoteDataSourceImpl implements RankingRemoteDataSource {
  @override
  Future<List<RankingModel>> getRankings() async {
    final instance = FirebaseFirestore.instance;
    final snapshot = await instance.collection('rank').get();
    print('snapshot: $snapshot');
    print('snapshot.docs: ${snapshot.docs}');
    print('snapshot.metadata: ${snapshot.metadata}');
    print('snapshot.size: ${snapshot.size}');
    print('snapshot.docChanges: ${snapshot.docChanges}');
    final ranking =
        snapshot.docs.map((e) => RankingModel.fromFireBase(e)).toList();
    return ranking;
  }
}
