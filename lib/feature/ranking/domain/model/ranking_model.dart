import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RankingModel {
  final String? nickname;
  final int? level;
  final String? email;
  final String? playTime;
  final int? rank;

  const RankingModel({
    this.nickname,
    this.level,
    this.email,
    this.playTime,
    this.rank,
  });

  factory RankingModel.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => RankingModel.fromJson(snapshot.data()!);

  factory RankingModel.fromJson(Map<String, dynamic> json) =>
      _$RankingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankingModelToJson(this);
}
