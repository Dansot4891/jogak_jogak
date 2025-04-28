import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store_version_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class StoreVersionDto {
  String? playStoreVersion;
  String? appStoreVersion;

  StoreVersionDto({this.playStoreVersion, this.appStoreVersion});

  factory StoreVersionDto.fromFireBase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) => StoreVersionDto.fromJson(snapshot.data()!);

  factory StoreVersionDto.fromJson(Map<String, dynamic> json) =>
      _$StoreVersionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StoreVersionDtoToJson(this);
}
