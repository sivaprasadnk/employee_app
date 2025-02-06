import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/main.dart';

abstract class LocalDatasource {
  Future addEmployee(EmployeeModel employee);
  Future editEmployee(EmployeeModel employee);
}

class LocalDatasourceImpl extends LocalDatasource {
  LocalDatasourceImpl();
  @override
  Future addEmployee(EmployeeModel employee) async {
    objectbox.store.box<EmployeeModel>().put(employee);
  }
  
  @override
  Future editEmployee(EmployeeModel employee) {
    // TODO: implement editEmployee
    throw UnimplementedError();
  }
}
