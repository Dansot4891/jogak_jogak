// 기본 베이스 유저 객체
abstract class AppUser {
  const AppUser();
}

// 비회원 유저
class UnCertifiedUser extends AppUser {}

// 회원 유저
class CertifiedUser extends AppUser {
  final String username;
  final String email;

  const CertifiedUser({required this.username, required this.email});

  CertifiedUser copyWith({String? username, String? email}) {
    return CertifiedUser(
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  @override
  String toString() => 'CertifiedUser(username: $username, email: $email)';

  @override
  bool operator ==(covariant CertifiedUser other) {
    if (identical(this, other)) return true;

    return other.username == username && other.email == email;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode;
}
