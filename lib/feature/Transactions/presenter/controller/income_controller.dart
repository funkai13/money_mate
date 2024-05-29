import 'dart:async';

import 'package:money_mate/feature/Transactions/domain/entity/income.dart';
import 'package:money_mate/feature/Transactions/domain/provider/transactions_provider.dart';
import 'package:riverpod/riverpod.dart';

enum IncomeStatus { none, success }

class IncomeController extends AutoDisposeAsyncNotifier<IncomeStatus> {
  @override
  FutureOr<IncomeStatus> build() => IncomeStatus.none;

  Future<List<Income>> getAllIncomes({
    required String uid,
    required String financeId,
  }) async {
    state = const AsyncLoading();
    final incomeRepo = ref.read(incomeServiceProvider);
    final incomes =
        await incomeRepo.getAllIncomes(uid: uid, financeId: financeId);
    print('pintando incomes $incomes');
    for (var income in incomes) {
      print(
          'Income: account=${income.account}, amount=${income.amount}, category=${income.category}, description=${income.description}, id=${income.id}, uid=${income.uid}');
    }
    return incomes;
  }
}

final incomeControllerProvider =
    AsyncNotifierProvider.autoDispose<IncomeController, IncomeStatus>(
        IncomeController.new);
