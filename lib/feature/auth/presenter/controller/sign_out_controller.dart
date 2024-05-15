import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:money_mate/routes.dart';
import 'package:riverpod/riverpod.dart';

enum LogoutStatus { none, sucess }

class LogoutController extends AutoDisposeAsyncNotifier<LogoutStatus> {
  @override
  FutureOr<LogoutStatus> build() => LogoutStatus.none;

  Future<void> signOut(BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signOutServiceProvider).signOut();
      context.go(Routes.auth);
      return LogoutStatus.sucess;
    });
  }
}

final logoutControllerProvider =
    AsyncNotifierProvider.autoDispose<LogoutController, LogoutStatus>(
  LogoutController.new,
);
