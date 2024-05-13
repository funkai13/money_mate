import 'package:money_mate/core/mobile_shared_utils/utils/failures/auth_failure.dart';
import 'package:money_mate/core/mobile_shared_utils/utils/result/result.dart';
import 'package:money_mate/feature/auth/domain/entity/app_user.dart';

abstract interface class SignUpRepository {
  Future<Result<AppUser, SignUpAuthFailure>> signUp({
    required String email,
    required String password,
  });
}
