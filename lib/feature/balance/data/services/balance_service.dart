import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:money_mate/feature/balance/domain/entity/balance.dart';
import 'package:money_mate/feature/balance/domain/repositories/balance_repository.dart';

import '../models/balance_model.dart';

class BalanceService implements BalanceRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  BalanceService(this._firestore, this._firebaseAuth);

  @override
  Future<AccountBalance> createAccountBalance(
      {required String title,
      required double balance,
      required DateTime creationDate,
      required DateTime updateDate}) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = '1';
    DocumentReference financesRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('finances')
        .doc(financeId);
    DocumentReference accountsRef = financesRef.collection('accounts').doc();
    AccountBalanceModel accountBalance = AccountBalanceModel(
      title: title,
      balance: balance,
      creationDate: creationDate,
      updateDate: updateDate,
    );
    await accountsRef.set(accountBalance.toFirestore());
    throw UnimplementedError();
  }

  @override
  Future<List<AccountBalance>> getALl() async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = '1';
    final accountsRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('finances')
        .doc(financeId)
        .collection('accounts');
    final querySnapshot = await accountsRef.get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    final balanceAccounts = querySnapshot.docs
        .map((e) => AccountBalanceModel.fromFirestore(e, null))
        .toList();
    return balanceAccounts;
  }
}
