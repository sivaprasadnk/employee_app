import 'package:employee_app/data/models/employee_model.dart';
import 'package:flutter/material.dart';

class CommonFunctions {
  static String getMonthAbbreviation(int month) {
    const List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return (month >= 1 && month <= 12) ? months[month - 1] : "Invalid";
  }

  static showSnackbar({
    required BuildContext context,
    required String message,
    SnackBarAction? action,
  }) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        action: action,
      ),
    );
  }

  static String validate(EmployeeModel model) {
    var msg = "";
    if (model.name.trim().isEmpty) {
      msg = "Employee name not entered";
    }
    if (model.role.isEmpty) {
      msg = "Role not selected";
    }
    return msg;
  }
}
