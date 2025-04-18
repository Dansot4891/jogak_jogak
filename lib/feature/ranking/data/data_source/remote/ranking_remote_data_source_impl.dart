import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/remote/ranking_remote_data_source.dart';

class RankingRemoteDataSourceImpl implements RankingRemoteDataSource {
  final FirebaseFirestore _instance;

  RankingRemoteDataSourceImpl(this._instance);

  @override
  Future<List<RankingDto>> getRankings(int level) async {
    final snapshot =
        await _instance.collection(FirebaseCollections.ranking).get();
    final ranking =
        snapshot.docs.map((e) => RankingDto.fromFireBase(e)).toList();
    return ranking;
  }
}
