import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jogak_jogak/core/constants/firebase_collections.dart';
import 'package:jogak_jogak/core/constants/firebase_query.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/ranking_dto.dart';
import 'package:jogak_jogak/feature/ranking/data/data_source/ranking_data_source.dart';
import 'package:jogak_jogak/feature/ranking/data/dto/upload_ranking_dto.dart';

class RankingRemoteDataSourceImpl implements RankingDataSource {
  final FirebaseFirestore _instance;

  RankingRemoteDataSourceImpl(this._instance);

  @override
  Future<List<RankingDto>> getRankings(int level) async {
    final snapshot =
        await _instance
            .collection(FirebaseCollections.ranking)
            .where(FirebaseQuery.level, isEqualTo: level)
            .orderBy(FirebaseQuery.playTime)
            .limit(15)
            .get();
    final ranking =
        snapshot.docs.map((e) => RankingDto.fromFireBase(e)).toList();
    return ranking;
  }

  @override
  Future<void> uploadRanking(UploadRankingDto uploadRanking) async {
    await _instance
        .collection(FirebaseCollections.ranking)
        .add(uploadRanking.toJson());
  }
}
