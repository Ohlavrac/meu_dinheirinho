class MovimentEntity {
  int? id;
  late String title;
  late double amount;
  DateTime? createdAt;
  late bool type;
  late String category;
  late bool repeat;
  late int repeatMonths;
  late String monthYearString;
  late String lastMonthYearString;
  DateTime? lastMonthYear;

  MovimentEntity({
    this.id,
    required this.title,
    required this.amount,
    this.createdAt,
    required this.type,
    required this.category,
    required this.repeat,
    required this.repeatMonths,
    required this.monthYearString,
    required this.lastMonthYearString,
    this.lastMonthYear
  });
}