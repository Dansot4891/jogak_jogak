import 'package:json_annotation/json_annotation.dart';

part 'app_version.g.dart';

@JsonSerializable(explicitToJson: true)
class AppVersion {
  final String playStoreVersion;
  final String appStoreVersion;

  AppVersion({required this.playStoreVersion, required this.appStoreVersion});

  factory AppVersion.fromJson(Map<String, dynamic> json) =>
      _$AppVersionFromJson(json);

  Map<String, dynamic> toJson() => _$AppVersionToJson(this);
}
