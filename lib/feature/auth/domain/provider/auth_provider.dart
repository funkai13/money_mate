import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/auth/data/api/sign_in_api.dart';
import 'package:money_mate/feature/auth/data/api/sign_out_api.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_in_repository.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_out_repository.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_up_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/api/sign_up_api.dart';

final signInServiceProvider =
    Provider<SignInRepository>((_) => SignInService(FirebaseAuth.instance));

final signUpServiceProvider =
    Provider<SignUpRepository>((_) => SignUpService(FirebaseAuth.instance));

final signOutServiceProvider = Provider<SignOutRepository>(
  (ref) => SignOutService(
    FirebaseAuth.instance,
  ),
);

final authStateChangesProvider = StreamProvider<User?>((ref) {
  final auth = FirebaseAuth.instance;
  return auth.authStateChanges();
});
