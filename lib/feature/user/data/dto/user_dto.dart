import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CertifiedUserDto {
  String? username;
  String? email;

  CertifiedUserDto({this.username, this.email});

  factory CertifiedUserDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => CertifiedUserDto.fromJson(snapshot.data()!);

  factory CertifiedUserDto.fromJson(Map<String, dynamic> json) =>
      _$CertifiedUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CertifiedUserDtoToJson(this);
}
