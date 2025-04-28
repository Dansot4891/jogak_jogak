class StoreVersion {
  final String playStoreVersion;
  final String appStoreVersion;
  StoreVersion({required this.playStoreVersion, required this.appStoreVersion});

  StoreVersion copyWith({String? playStoreVersion, String? appStoreVersion}) {
    return StoreVersion(
      playStoreVersion: playStoreVersion ?? this.playStoreVersion,
      appStoreVersion: appStoreVersion ?? this.appStoreVersion,
    );
  }

  @override
  String toString() =>
      'StoreVersion(playStoreVersion: $playStoreVersion, appStoreVersion: $appStoreVersion)';

  @override
  bool operator ==(covariant StoreVersion other) {
    if (identical(this, other)) return true;

    return other.playStoreVersion == playStoreVersion &&
        other.appStoreVersion == appStoreVersion;
  }

  @override
  int get hashCode => playStoreVersion.hashCode ^ appStoreVersion.hashCode;
}
