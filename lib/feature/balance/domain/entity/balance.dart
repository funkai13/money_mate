class AccountBalance {
  const AccountBalance(
      {required this.title,
      required this.balance,
      required this.creationDate,
      required this.updateDate});
  final String title;
  final double balance;
  final DateTime creationDate;
  final DateTime? updateDate;
}
