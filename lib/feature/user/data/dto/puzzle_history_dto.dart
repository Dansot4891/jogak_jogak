import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'puzzle_history_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PuzzleHistoryDto {
  int? level;
  String? playTime;
  DateTime? playDate;

  PuzzleHistoryDto(this.level, this.playTime, this.playDate);

  factory PuzzleHistoryDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => PuzzleHistoryDto.fromJson(snapshot.data()!);

  factory PuzzleHistoryDto.fromJson(Map<String, dynamic> json) =>
      _$PuzzleHistoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleHistoryDtoToJson(this);
}
