import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/data/repository/repository_impl.dart';

class DeleteEmployee {
  final RepositoryImpl repository;
  DeleteEmployee(this.repository);

  Future call(EmployeeModel employee) async {
    return await repository.deleteEmployee(employee);
  }
}
