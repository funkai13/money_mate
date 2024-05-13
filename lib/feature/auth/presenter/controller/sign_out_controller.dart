import 'dart:async';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:riverpod/riverpod.dart';

enum LogoutStatus { none, sucess }

class LogoutController extends AutoDisposeAsyncNotifier<LogoutStatus> {
  @override
  FutureOr<LogoutStatus> build() => LogoutStatus.none;

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref.read(signOutServiceProvider).signOut();
      return LogoutStatus.sucess;
    });
  }
}

final logoutControllerProvider =
    AsyncNotifierProvider.autoDispose<LogoutController, LogoutStatus>(
  LogoutController.new,
);
