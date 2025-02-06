import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/main.dart';

abstract class LocalDatasource {
  Future addOrUpdateEmployee(EmployeeModel employee);
  Future deleteEmployee(EmployeeModel employee);
}

class LocalDatasourceImpl extends LocalDatasource {
  LocalDatasourceImpl();
  @override
  Future addOrUpdateEmployee(EmployeeModel employee) async {
    objectbox.store.box<EmployeeModel>().put(employee);
  }
  
  @override
  Future deleteEmployee(EmployeeModel employee) async {
    objectbox.store.box<EmployeeModel>().remove(employee.id);
  }
  
}
