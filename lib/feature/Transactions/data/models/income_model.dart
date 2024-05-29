import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mate/feature/Transactions/domain/entity/income.dart';

class IncomeModel extends Income {
  IncomeModel({
    required super.account,
    required super.amount,
    required super.category,
    required super.description,
    required super.id,
    required super.uid,
  });

  factory IncomeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return IncomeModel(
        account: data?['account'],
        amount: data?['amount'],
        category: data?['category'],
        description: data?['description'],
        id: data?['id'],
        uid: data?['uid']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "account": account,
      "amount": amount,
      "category": category,
      "description": description,
      "id": id,
      "uid": uid,
    };
  }
}
