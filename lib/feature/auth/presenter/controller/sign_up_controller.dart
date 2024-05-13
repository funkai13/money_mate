import 'dart:async';
import 'package:money_mate/feature/auth/domain/provider/auth_provider.dart';
import 'package:riverpod/riverpod.dart';

enum SignUpStatus { none, success }

class SignUpController extends AutoDisposeAsyncNotifier<SignUpStatus> {
  @override
  FutureOr<SignUpStatus> build() => SignUpStatus.none;

  Future<void> signUp({required String email, required String password}) async {
    state = const AsyncLoading();

    final authRepo = ref.read(signUpServiceProvider);

    final result = await authRepo.signUp(email: email, password: password);
    result.fold(
      (value) => state = const AsyncData(SignUpStatus.success),
      (err) => state = AsyncError(err, StackTrace.current),
    );
  }
}

final signUpControllerProvider =
    AsyncNotifierProvider.autoDispose<SignUpController, SignUpStatus>(
        SignUpController.new);
