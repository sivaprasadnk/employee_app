import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/data/repository/repository_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<LocalDatasourceImpl>(LocalDatasourceImpl());
  locator.registerSingleton<RepositoryImpl>(RepositoryImpl(locator()));
}
