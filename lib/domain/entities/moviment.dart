class Moviment {
  int? id;
  String? title;
  double? amount;
  DateTime? createdAt;
  bool? type;
  String? category;
  bool? repeat;
  int? repeatMonths;
  String? monthYearString;
  String? lastMonthYearString;
  DateTime? LastMonthYear;

  Moviment({
    this.id,
    this.title,
    this.amount,
    this.createdAt,
    this.type,
    this.category,
    this.repeat,
    this.repeatMonths,
    this.monthYearString,
    this.lastMonthYearString,
    this.LastMonthYear
  });
}