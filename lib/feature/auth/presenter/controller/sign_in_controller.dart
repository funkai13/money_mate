import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:money_mate/routes.dart';
import 'package:riverpod/riverpod.dart';

enum SignInStatus { none, success }

class SignInController extends AutoDisposeAsyncNotifier<SignInStatus> {
  @override
  FutureOr<SignInStatus> build() => SignInStatus.none;

  Future<void> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = const AsyncLoading();

    final authRepo = ref.read(signInServiceProvider);

    final result = await authRepo.signIn(email: email, password: password);
    context.go(Routes.home);
    result.fold(
      (value) {
        state = const AsyncData(SignInStatus.success);
        context.go(Routes.home);
        print('estoy entrando al fold');
      },
      (err) => state = AsyncError(err, StackTrace.current),
    );
  }

  Future<void> signInAnonymous(BuildContext context) async {
    state = const AsyncLoading();

    final authRepo = ref.read(signInServiceProvider);
    final result = await authRepo.signInAnonymous();
    context.go(Routes.home);
    result.fold((value) => state = const AsyncData(SignInStatus.success),
        (err) => state = AsyncError(err, StackTrace.current));
  }
}

final signInControllerProvider =
    AsyncNotifierProvider.autoDispose<SignInController, SignInStatus>(
        SignInController.new);
