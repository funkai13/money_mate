import '../entity/balance.dart';

abstract interface class BalanceRepository {
  Future<AccountBalance> createAccountBalance({
    required String title,
    required double balance,
    required DateTime creationDate,
    required DateTime updateDate,
  });
  Future<List<AccountBalance>> getALl();
}
