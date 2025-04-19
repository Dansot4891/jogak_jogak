import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RankingDto {
  final String? nickname;
  final int? level;
  final String? email;
  final int? playTime;
  final int? rank;

  const RankingDto({
    this.nickname,
    this.level,
    this.email,
    this.playTime,
    this.rank,
  });

  factory RankingDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => RankingDto.fromJson(snapshot.data()!);

  factory RankingDto.fromJson(Map<String, dynamic> json) =>
      _$RankingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RankingDtoToJson(this);
}
