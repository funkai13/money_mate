import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mate/feature/Transactions/domain/entity/income.dart';

class IncomeModel extends Income {
  IncomeModel({
    required super.amount,
    required super.category,
    required super.description,
    required super.title,
    required super.updateDate,
    required super.creationDate,
  });

  factory IncomeModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return IncomeModel(
      amount: data?['amount'],
      category: data?['category'],
      description: data?['description'],
      title: data?['title'],
      creationDate: (data?['creation_date'] as Timestamp?)!
          .toDate(), // Convierte Timestamp a DateTime
      updateDate: (data?['update_date'] as Timestamp?)!.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'update_date': updateDate,
      'creation_date': creationDate,
      'amount': amount,
      'category': category,
      'description': description,
    };
  }
}
