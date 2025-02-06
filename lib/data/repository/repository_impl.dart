import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/domain/repository.dart';

class RepositoryImpl extends Repository {
  final LocalDatasource localDatasource;
  RepositoryImpl(this.localDatasource);
  @override
  Future addEmployee(EmployeeModel employee) async {
    return await localDatasource.addEmployee(employee);
  }
}
