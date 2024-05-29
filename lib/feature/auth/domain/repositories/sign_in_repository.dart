import 'package:money_mate/core/mobile_shared_utils/utils/failures/auth_failure.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/result/result.dart';
import 'package:money_mate/feature/auth/domain/entity/auth_user.dart';

abstract interface class SignInRepository {
  Future<Result<AuthUser, SignInAuthFailure>> signIn({
    required String email,
    required String password,
  });

  Future<Result<AuthUser, SignInAuthFailure>> signInAnonymous();
}
