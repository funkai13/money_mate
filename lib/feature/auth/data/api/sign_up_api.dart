import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/failures/auth_failure.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/result/result.dart';
import 'package:money_mate/feature/auth/domain/entity/auth_user.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_up_repository.dart';

class SignUpService implements SignUpRepository {
  const SignUpService(this.client);
  final FirebaseAuth client;

  @override
  Future<Result<AuthUser, SignUpAuthFailure>> signUp(
      {required String email, required String password}) async {
    try {
      final credentials = await client.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = credentials.user;
      if (user != null) {
        return Success(AuthUser(
          id: user.uid,
          email: user.email ?? '',
        ));
      }
      return Err(SignUpAuthFailure.userNotCreate);
    } on FirebaseAuthException catch (e) {
      return Err(
        SignUpAuthFailure.values.firstWhere(
          (failure) => failure.code == e.code,
          orElse: () => SignUpAuthFailure.unknown,
        ),
      );
    } catch (_) {
      return Err(SignUpAuthFailure.unknown);
    }
  }
}
