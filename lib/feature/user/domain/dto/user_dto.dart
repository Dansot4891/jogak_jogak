import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDto {
  final String username;
  final String email;

  UserDto({required this.username, required this.email});

  // -- fromJson은 불필요 --

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
