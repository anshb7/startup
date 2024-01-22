class payment {
  double amount = 0;
  String tID = "";
  String fromID = "";
  String toID = "";
  int statusCode = -1;
  String dueDate = "";
  String pDate = "";

  payment(
      {required this.amount,
      required this.tID,
      required this.toID,
      required this.fromID,
      required this.statusCode,
      required this.dueDate,
      required this.pDate});
}
