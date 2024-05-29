import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mate/feature/Transactions/domain/entity/income.dart';
import 'package:money_mate/feature/Transactions/domain/repositories/income_repository.dart';

import '../models/income_model.dart';

class IncomeService implements IncomeRepository {
  final FirebaseFirestore _firestore;

  IncomeService(this._firestore);

  @override
  Future<List<Income>> getAllIncomes({
    required String uid,
    required String financeId,
  }) async {
    final collectionPath = 'users/$uid/finances/$financeId/income';
    final reference = _firestore.collection(collectionPath);
    final querySnapshot = await reference.get();

    if (querySnapshot.docs.isEmpty) {
      return [];
    }

    final incomes = querySnapshot.docs
        .map((doc) => IncomeModel.fromFirestore(doc, null))
        .toList();

    return incomes;
  }
}
