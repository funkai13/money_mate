class Income {
  const Income({
    required this.uid,
    required this.id,
    required this.account,
    required this.amount,
    required this.category,
    required this.description,
    //required this.date,
  });
  final String? uid;
  final String? id;
  final String? account;
  final int? amount;
  final String? category;
  final String? description;
  //final DateTime? date;
}
