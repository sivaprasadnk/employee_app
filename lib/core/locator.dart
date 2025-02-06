import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/data/repository/repository_impl.dart';
import 'package:employee_app/domain/use_cases/add_update_employee.dart';
import 'package:get_it/get_it.dart';
final locator = GetIt.instance;

void setup() {
  // locator.registerSingleton<Box<EmployeeModel>>(Box<EmployeeModel>());

  // locator.registerSingletonAsync<ObjectBox>(() async {
  //   final objectBox = ObjectBox();
  //   await objectBox.init();
  //   return objectBox;
  // });
  locator.registerSingleton<LocalDatasourceImpl>(LocalDatasourceImpl());
  locator.registerSingleton<RepositoryImpl>(RepositoryImpl(locator()));
  locator
      .registerSingleton<AddOrUpdateEmployee>(AddOrUpdateEmployee(locator()));
}
