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
}
