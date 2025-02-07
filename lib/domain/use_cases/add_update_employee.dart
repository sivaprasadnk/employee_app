import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/data/repository/repository_impl.dart';

class AddOrUpdateEmployee {
  final RepositoryImpl repository;
  AddOrUpdateEmployee(this.repository);

  Future call(EmployeeModel employee) async {
    return await repository.addEmployee(employee);
  }
}
