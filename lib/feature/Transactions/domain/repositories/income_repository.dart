import 'package:money_mate/feature/Transactions/domain/entity/income.dart';

abstract interface class IncomeRepository {
  Future<List<Income>> getAllIncomes({
    required String uid,
    required String financeId,
  });
}
