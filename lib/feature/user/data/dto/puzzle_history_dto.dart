// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'puzzle_history_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PuzzleHistoryDto {
  int? level;
  int? playTime;
  DateTime? playDate;

  PuzzleHistoryDto({
    required this.level,
    required this.playTime,
    required this.playDate,
  });

  factory PuzzleHistoryDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => PuzzleHistoryDto.fromJson(snapshot.data()!);

  factory PuzzleHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$PuzzleHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleHistoryDtoToJson(this);
}
