class MovimentEntity {
  int? id;
  late String title;
  late double amount;
  DateTime? createdAt;
  late bool type;
  late String category;
  late bool repeat;
  int? repeatMonths;
  late String monthYearString;
  late String lastMonthYearString;
  DateTime? LastMonthYear;

  MovimentEntity({
    this.id,
    required this.title,
    required this.amount,
    this.createdAt,
    required this.type,
    required this.category,
    required this.repeat,
    this.repeatMonths,
    required this.monthYearString,
    required this.lastMonthYearString,
    this.LastMonthYear
  });
}