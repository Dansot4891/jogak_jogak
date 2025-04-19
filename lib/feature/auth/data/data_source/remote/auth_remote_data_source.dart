abstract interface class AuthRemoteDataSource {
  Future<String> signIn({required String email, required String password});

  Future<void> signOut();

  Future<void> signUp({
    required String email,
    required String password,
    required String username,
  });

  Future<void> changePassword(String email);
}
