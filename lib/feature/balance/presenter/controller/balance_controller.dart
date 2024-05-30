import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/balance/domain/provider/balance_provider.dart';

import '../../domain/entity/balance.dart';

enum BalanceStatus { none, success }

class BalanceController extends AutoDisposeAsyncNotifier<List<AccountBalance>> {
  @override
  FutureOr<List<AccountBalance>> build() async {
    return await getAll();
  }

  Future<List<AccountBalance>> getAll() async {
    final balanceRepo = ref.read(balanceServiceProvider);
    final accountsBalances = await balanceRepo.getALl();
    print('pintando balances');
    for (var accountBalance in accountsBalances) {
      print(
          ' balance title : ${accountBalance.title} ${accountBalance.balance} ${accountBalance.creationDate}');
    }
    state = AsyncValue.data(accountsBalances);
    return accountsBalances;
  }
}

final balanceControllerProvider =
    AsyncNotifierProvider.autoDispose<BalanceController, List<AccountBalance>>(
        BalanceController.new);
