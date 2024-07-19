import 'package:money_mate/feature/Transactions/domain/entity/income.dart';

abstract interface class IncomeRepository {
  Future<List<Income>> getAllIncomes({
    required String accountBalance,
  });
  Future<Income> createIncome({
    required String accountBalance,
    required String title,
    required double amount,
    required String category,
    required String description,
    required DateTime creationDate,
    required DateTime updateDate,
  });
  Future<Income> getOne({
    required String accountBalance,
    required String currentTitle,
    required double amount,
  });
  Future<void> delete({
    required String accountBalance,
    required String currentTitle,
    required double amount,
  });
}
