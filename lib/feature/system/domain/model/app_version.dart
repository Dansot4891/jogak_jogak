class AppVersion {
  final String version;

  AppVersion(this.version);

  AppVersion copyWith({String? version}) {
    return AppVersion(version ?? this.version);
  }

  @override
  String toString() => 'AppVersion(version: $version)';

  @override
  bool operator ==(covariant AppVersion other) {
    if (identical(this, other)) return true;

    return other.version == version;
  }

  @override
  int get hashCode => version.hashCode;
}
