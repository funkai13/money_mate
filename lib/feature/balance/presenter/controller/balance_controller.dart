import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_mate/feature/balance/domain/provider/balance_provider.dart';

import '../../domain/entity/balance.dart';

class BalanceController extends AutoDisposeAsyncNotifier<List<AccountBalance>> {
  @override
  FutureOr<List<AccountBalance>> build() async {
    return await getAll();
  }

  Future<List<AccountBalance>> getAll() async {
    final balanceRepo = ref.read(balanceServiceProvider);
    final accountsBalances = await balanceRepo.getAll();
    print('pintando balances');
    for (var accountBalance in accountsBalances) {
      print(
          ' balance title : ${accountBalance.title} ${accountBalance.balance} ${accountBalance.creationDate}');
    }
    state = AsyncValue.data(accountsBalances);
    return accountsBalances;
  }

  Future<AccountBalance> createAccountBalance({
    required String title,
    required double balance,
    required DateTime creationDate,
    required DateTime updateDate,
  }) async {
    final balanceRepo = ref.read(balanceServiceProvider);
    final accountBalance = await balanceRepo.createAccountBalance(
      title: title,
      balance: balance,
      creationDate: creationDate,
      updateDate: updateDate,
    );
    state = state.whenData((balances) => [...balances, accountBalance]);
    return accountBalance;
  }

  Future<AccountBalance> getOne({
    required String id,
  }) async {
    final balanceRepo = ref.read(balanceServiceProvider);
    final accountBalance = await balanceRepo.getOne(id: id);
    return accountBalance;
  }

  Future<AccountBalance> updateOne({
    required String currentTitle,
    required String newTitle,
    required double balance,
  }) async {
    final balanceRepo = ref.read(balanceServiceProvider);
    final accountBalance = await balanceRepo.update(
        currentTitle: currentTitle, newTitle: newTitle, balance: balance);
    state = state.whenData((balances) => [...balances, accountBalance]);
    return accountBalance;
  }

  Future<void> delete({
    required String currentTitle,
  }) async {
    try {
      final balanceRepo = ref.read(balanceServiceProvider);
      await balanceRepo.delete(
        currentTitle: currentTitle,
      );

      state = state.whenData((balances) =>
          balances.where((balance) => balance.title != currentTitle).toList());

      ref.refresh(balanceServiceProvider);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      print('Error deleting account: $e');
    }
  }
}

final balanceControllerProvider =
    AsyncNotifierProvider.autoDispose<BalanceController, List<AccountBalance>>(
        BalanceController.new);
