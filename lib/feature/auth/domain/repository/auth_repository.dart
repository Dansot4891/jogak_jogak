abstract interface class AuthRepository {
  Future<void> signOut();

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<String> signIn({required String email, required String password});

  Future<void> changePassword(String email);
}
