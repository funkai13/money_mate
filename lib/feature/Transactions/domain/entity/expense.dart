import 'dart:ffi';

class Expense {
  const Expense({
    required this.id,
    required this.account,
    required this.amount,
    required this.category,
    required this.description,
  });
  final String id;
  final String account;
  final Double amount;
  final String category;
  final String description;
}
