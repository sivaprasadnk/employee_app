import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/data/repository/repository_impl.dart';
import 'package:employee_app/domain/use_cases/add_update_employee.dart';
import 'package:employee_app/domain/use_cases/delete_employee.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  // final executor = FlutterQueryExecutor.inDatabaseFolder(
  //   path: 'app.db',
  //   logStatements: true, // Optional: Enable SQL logging
  // );
  // locator.registerLazySingleton<EmployeeDatabase>(() => EmployeeDatabase(executor));

  locator.registerSingleton<LocalDatasourceImpl>(LocalDatasourceImpl());
  locator.registerSingleton<RepositoryImpl>(RepositoryImpl(locator()));
  locator
      .registerSingleton<AddOrUpdateEmployee>(AddOrUpdateEmployee(locator()));
  locator.registerSingleton<DeleteEmployee>(DeleteEmployee(locator()));

}
