import '../entity/balance.dart';

abstract interface class BalanceRepository {
  Future<AccountBalance> createAccountBalance({
    required String title,
    required double balance,
    required DateTime creationDate,
    required DateTime updateDate,
  });
  Future<List<AccountBalance>> getAll();

  Future<AccountBalance> getOne({
    required String id,
  });

  Future<AccountBalance> update({
    required String currentTitle,
    required String newTitle,
    required double balance,
  });
  Future<void> delete({
    required String currentTitle,
  });
}
