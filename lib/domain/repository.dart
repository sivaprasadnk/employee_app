import 'package:employee_app/data/models/employee_model.dart';

abstract class Repository {
  Future addEmployee(EmployeeModel employee);
  Future deleteEmployee(EmployeeModel employee);
}
