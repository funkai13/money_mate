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
  Future<AccountBalance> createAccountBalance({
    required String title,
    required double balance,
    required DateTime creationDate,
    required DateTime updateDate,
  }) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = uid;
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
    return accountBalance;
  }

  @override
  Future<List<AccountBalance>> getAll() async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = uid;
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

  @override
  Future<AccountBalanceModel> getOne({required String id}) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = uid;

    return _firestore
        .collection('users')
        .doc(uid)
        .collection('finances')
        .doc(financeId)
        .collection('accounts')
        .doc(id)
        .get()
        .then((docSnapshot) =>
            AccountBalanceModel.fromFirestore(docSnapshot, null));
  }

  @override
  Future<AccountBalance> update(
      {required String currentTitle,
      required double balance,
      required String newTitle}) async {
    String uid = _firebaseAuth.currentUser!.uid;
    String financeId = uid;
    final accountsRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('finances')
        .doc(financeId)
        .collection('accounts');
    final querySnapshot =
        await accountsRef.where('title', isEqualTo: currentTitle).get();
    final accountDoc = querySnapshot.docs.first;

    await accountDoc.reference.update({
      'title': newTitle,
      'balance': balance,
      'update_date': FieldValue.serverTimestamp(),
    });

    return AccountBalanceModel.fromFirestore(accountDoc, null);
  }

  @override
  Future<void> delete({required String currentTitle}) async {
    try {
      String uid = _firebaseAuth.currentUser!.uid;
      String financeId = uid;

      final accountsRef = _firestore
          .collection('users')
          .doc(uid)
          .collection('finances')
          .doc(financeId)
          .collection('accounts');

      final querySnapshot =
          await accountsRef.where('title', isEqualTo: currentTitle).get();

      if (querySnapshot.docs.isNotEmpty) {
        final accountDoc = querySnapshot.docs.first;
        await accountDoc.reference.delete();
      } else {
        throw Exception("No account found with title $currentTitle");
      }
    } catch (e) {
      print('Error deleting account: $e');
      throw e;
    }
  }
}
