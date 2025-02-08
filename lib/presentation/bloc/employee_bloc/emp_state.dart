import 'package:employee_app/data/models/employee_model.dart';

class EmpState {
  List<EmployeeModel>? employeesList;
  bool isLoading;
  EmpState({
    this.employeesList = const [],
    this.isLoading = true,
  });

  EmpState copyWith({List<EmployeeModel>? list, bool? loading}) {
    return EmpState(
      employeesList: list ?? employeesList,
      isLoading: loading ?? isLoading,
    );
  }
}
