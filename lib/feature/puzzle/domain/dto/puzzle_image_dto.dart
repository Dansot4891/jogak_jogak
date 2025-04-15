// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'puzzle_image_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class PuzzleImageDto {
  final String imageUrl;
  final String source;

  PuzzleImageDto({required this.imageUrl, required this.source});

  factory PuzzleImageDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => PuzzleImageDto.fromJson(snapshot.data()!);

  factory PuzzleImageDto.fromJson(Map<String, dynamic> json) =>
      _$PuzzleImageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PuzzleImageDtoToJson(this);
}
