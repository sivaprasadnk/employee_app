import 'package:employee_app/data/models/employee_model.dart';

abstract class Repository {
  Future addOrUpdateEmployee(EmployeeModel employee);
  Future deleteEmployee(EmployeeModel employee);
}
