import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  String? username;
  String? email;

  UserDto({this.username, this.email});

  factory UserDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => UserDto.fromJson(snapshot.data()!);

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
