import 'package:employee_app/core/common_functions.dart';

extension DatetimeExtensions on DateTime {
  String displayDate() {
    var value = "";
    var day = this.day.toString();
    var year = this.year.toString();
    var month = CommonFunctions.getMonthAbbreviation(this.month);
    value = "$day $month $year";
    return value;
  }

  DateTime get now => DateTime.now();

  bool get isToday => now.year == year && now.month == month && now.day == day;

  // bool get isPastDays()

  DateTime nextMonday() {
    int daysUntilMonday = ((DateTime.monday - weekday + 7) % 7).toInt();
    return add(Duration(days: daysUntilMonday == 0 ? 7 : daysUntilMonday));
  }

  DateTime nextTuesday() {
    int daysUntilTuesday = ((DateTime.tuesday - weekday + 7) % 7).toInt();
    return add(Duration(days: daysUntilTuesday == 0 ? 7 : daysUntilTuesday));
  }
}
