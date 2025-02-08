import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/main.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_bloc.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    required String message,
    SnackBarAction? action,
  }) async {
    var context = navigatorKey.currentState!.context;
    ScaffoldMessenger.of(context).clearSnackBars();
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

  static addorUpdateEmployee({
    required BuildContext context,
    required EmployeeModel model,
    required int index,
  }) {
    var validationMsg = validate(model);
    if (validationMsg.isEmpty) {
      if (index == -1) {
        debugPrint("## here addd");

        context.read<EmpBloc>().add(AddEmployeeEvent(model));
      } else {
        debugPrint("## here update");
        context.read<EmpBloc>().add(UpdateEmployeeEvent(model));
      }
      Navigator.pop(context);
    } else {
      if (context.mounted) {
        showSnackbar(message: validationMsg);
      }
    }
  }

  static deleteEmployee({
    required EmployeeModel model,
    required int index,
  }) async {
    var context = navigatorKey.currentState!.context;
    var prevList = context.read<EmpBloc>().state.employeesList!;
    index = prevList.indexOf(model);
    context.read<EmpBloc>().add(RemoveEmployeeEvent(model));
    showSnackbar(
      message: 'Employee data has been deleted',
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () async {
          context.read<EmpBloc>().add(
                UndoRemoveEmployeeEvent(
                  model,
                  index,
                  prevList: prevList,
                ),
              );
        },
      ),
    );
  }
}
