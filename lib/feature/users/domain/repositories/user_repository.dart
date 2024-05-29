import '../entity/app_user.dart';

abstract interface class UserRepository {
  Future<AppUser> createUser({
    required String? email,
    required String firstName,
    required String lastName,
    required double age,
  });
}
