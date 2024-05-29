import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/feature/users/domain/provider/user_provider.dart';

import '../../../../routes.dart';

enum ProfileRegisterStatus { none, success }

class UserProfileRegisterController
    extends AutoDisposeAsyncNotifier<ProfileRegisterStatus> {
  @override
  FutureOr<ProfileRegisterStatus> build() => ProfileRegisterStatus.none;

  Future<void> createUser({
    required String? email,
    required double age,
    required String firstName,
    required String lastName,
    required BuildContext context,
  }) async {
    state = const AsyncLoading();
    final userRepo = ref.read(userServiceProvider);
    final result = await userRepo.createUser(
        email: email, firstName: firstName, lastName: lastName, age: age);
    context.go(Routes.home);
    result;
  }
}

final userProfileRegisterControllerProvider = AsyncNotifierProvider.autoDispose<
    UserProfileRegisterController,
    ProfileRegisterStatus>(UserProfileRegisterController.new);
