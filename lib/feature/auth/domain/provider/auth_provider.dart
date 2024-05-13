import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/auth/data/api/sign_in_api.dart';
import 'package:money_mate/feature/auth/domain/repositories/sign_in_repository.dart';
import 'package:riverpod/riverpod.dart';

final signInServiceProvider =
    Provider<SignInRepository>((_) => SignInService(FirebaseAuth.instance));
