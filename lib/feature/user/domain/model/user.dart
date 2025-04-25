class AppUser {
  final String username;
  final String email;

  const AppUser({required this.username, required this.email});

  AppUser copyWith({String? username, String? email}) {
    return AppUser(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'AppUser(username: $username, email: $email)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.username == username && other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode;
}
