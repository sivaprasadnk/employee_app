import 'package:employee_app/data/models/employee_model.dart';

abstract class EmpEvent {}

class AddEmployeeEvent extends EmpEvent {
  final EmployeeModel employeeModel;
  AddEmployeeEvent(this.employeeModel);
}

class UpdateEmployeeEvent extends EmpEvent {
  final EmployeeModel employeeModel;
  UpdateEmployeeEvent(this.employeeModel);
}

class GetEmployeesEvent extends EmpEvent {
  GetEmployeesEvent();
}

class RemoveEmployeeEvent extends EmpEvent {
  final EmployeeModel employeeModel;
  RemoveEmployeeEvent(this.employeeModel);
}
