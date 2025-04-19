import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_ranking_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadRankingDto {
  final String? nickname;
  final int? level;
  final String? email;
  final String? playTime;
  final int? rank;

  const UploadRankingDto({
    this.nickname,
    this.level,
    this.email,
    this.playTime,
    this.rank,
  });

  factory UploadRankingDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => UploadRankingDto.fromJson(snapshot.data()!);

  factory UploadRankingDto.fromJson(Map<String, dynamic> json) =>
      _$UploadRankingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UploadRankingDtoToJson(this);
}
