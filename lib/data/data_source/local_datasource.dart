import 'package:employee_app/data/models/employee_model.dart';

abstract class LocalDatasource {
  Future addEmployee(EmployeeModel employee);
}

class LocalDatasourceImpl extends LocalDatasource {
  @override
  Future addEmployee(EmployeeModel employee) async {}
}
