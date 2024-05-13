import 'dart:async';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:riverpod/riverpod.dart';

enum SignInStatus { none, success }

class SignInController extends AutoDisposeAsyncNotifier<SignInStatus> {
  @override
  FutureOr<SignInStatus> build() => SignInStatus.none;

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();

    final authRepo = ref.read(signInServiceProvider);

    final result = await authRepo.signIn(email: email, password: password);
    result.fold(
      (value) => state = const AsyncData(SignInStatus.success),
      (err) => state = AsyncError(err, StackTrace.current),
    );
  }

  Future<void> signInAnonymous() async {
    state = const AsyncLoading();

    final authRepo = ref.read(signInServiceProvider);
    final result = await authRepo.signInAnonymous();
    print(' este es el resultado${result}');
    result.fold((value) => state = const AsyncData(SignInStatus.success),
        (err) => state = AsyncError(err, StackTrace.current));
  }
}

final signInControllerProvider =
    AsyncNotifierProvider.autoDispose<SignInController, SignInStatus>(
        SignInController.new);
