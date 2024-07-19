import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/Transactions/domain/entity/income.dart';
import 'package:money_mate/feature/Transactions/domain/repositories/income_repository.dart';

class IncomeService implements IncomeRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  IncomeService(this._firestore, this._firebaseAuth);

  @override
  Future<List<Income>> getAllIncomes({
    required String accountBalance,
  }) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = uid;
    final incomesRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('finances')
        .doc(financeId)
        .collection('accounts')
        .doc(accountBalance);
    throw UnimplementedError();
  }

  @override
  Future<Income> createIncome(
      {required String accountBalance,
      required String title,
      required double amount,
      required String category,
      required String description,
      required DateTime creationDate,
      required DateTime updateDate}) {
    // TODO: implement createIncome
    throw UnimplementedError();
  }

  @override
  Future<void> delete(
      {required String accountBalance,
      required String currentTitle,
      required double amount}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Income> getOne(
      {required String accountBalance,
      required String currentTitle,
      required double amount}) {
    // TODO: implement getOne
    throw UnimplementedError();
  }
}
