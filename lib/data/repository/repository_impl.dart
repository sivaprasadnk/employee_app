import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/domain/repository.dart';

class RepositoryImpl extends Repository {
  final LocalDatasourceImpl localDatasource;
  RepositoryImpl(this.localDatasource);
  @override
  Future addOrUpdateEmployee(EmployeeModel employee) async {
    return await localDatasource.addOrUpdateEmployee(employee);
  }

  @override
  Future deleteEmployee(EmployeeModel employee) async {
    return await localDatasource.deleteEmployee(employee);
  }
}
