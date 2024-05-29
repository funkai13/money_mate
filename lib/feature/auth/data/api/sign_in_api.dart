import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/failures/auth_failure.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/result/result.dart';
import 'package:money_mate/feature/auth/domain/entity/auth_user.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_in_repository.dart';

class SignInService implements SignInRepository {
  const SignInService(this.client);

  final FirebaseAuth client;

  @override
  Future<Result<AuthUser, SignInAuthFailure>> signInAnonymous() async {
    try {
      final credentials = await client.signInAnonymously();
      final user = credentials.user;

      if (user != null) {
        return Success(
          AuthUser(
            id: user.uid,
            email: user.email ?? '',
          ),
        );
      }
      return Err(SignInAuthFailure.userNotFound);
    } on FirebaseAuthException catch (e) {
      return Err(
        SignInAuthFailure.values.firstWhere(
          (failure) => failure.code == e.code,
          orElse: () => SignInAuthFailure.unknown,
        ),
      );
    } catch (_) {
      return Err(SignInAuthFailure.unknown);
    }
  }

  @override
  Future<Result<AuthUser, SignInAuthFailure>> signIn(
      {required String email, required String password}) async {
    try {
      final credentials = await client.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credentials.user;
      if (user != null) {
        return Success(
          AuthUser(
            id: user.uid,
            email: user.email ?? '',
          ),
        );
      }
      return Err(SignInAuthFailure.userNotFound);
    } on FirebaseAuthException catch (e) {
      return Err(
        SignInAuthFailure.values.firstWhere(
          (failure) => failure.code == e.code,
          orElse: () => SignInAuthFailure.unknown,
        ),
      );
    } catch (_) {
      return Err(SignInAuthFailure.unknown);
    }
  }
}
