import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_out_repository.dart';

class SignOutService implements SignOutRepository {
  SignOutService(this.auth);

  final FirebaseAuth auth;

  @override
  Future<void> signOut() => auth.signOut();
}
