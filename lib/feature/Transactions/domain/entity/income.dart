class Income {
  const Income({
    required this.title,
    required this.amount,
    required this.category,
    required this.description,
    required this.updateDate,
    required this.creationDate,
    //required this.date,
  });
  final String title;
  final double amount;
  final String category;
  final String? description;
  final DateTime creationDate;
  final DateTime? updateDate;
}
