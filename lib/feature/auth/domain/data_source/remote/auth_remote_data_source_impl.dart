import 'package:firebase_auth/firebase_auth.dart';
import 'package:jogak_jogak/feature/auth/domain/data_source/remote/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
