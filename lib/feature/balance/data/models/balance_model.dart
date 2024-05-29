import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entity/balance.dart';

class AccountBalanceModel extends AccountBalance {
  AccountBalanceModel({
    required super.title,
    required super.balance,
    required super.creationDate,
    required super.updateDate,
  });

  factory AccountBalanceModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return AccountBalanceModel(
      title: data?['title'],
      balance: data?['balance'],
      creationDate: data?['creation_date'],
      updateDate: data?['update_date'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'balance': balance,
      'creation_date': creationDate,
      'update_date': updateDate,
    };
  }
}
