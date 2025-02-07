import 'package:drift/drift.dart';
import 'package:employee_app/core/emp_db.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/data/models/employee_model.dart';

abstract class LocalDatasource {
  Future addEmployee(EmployeeModel employee);
  Future deleteEmployee(EmployeeModel employee);
  Stream<List<EmployeeModel>> getEmployees();
  Future updateEmployee(EmployeeModel employee);
}

class LocalDatasourceImpl extends LocalDatasource {
  LocalDatasourceImpl();

  @override
  Future addEmployee(EmployeeModel employee) async {
    final database = EmployeeDatabase();
    var enddate =
        employee.endDate == null ? "" : employee.endDate!.displayDate();
    await database.into(database.employees).insert(EmployeesCompanion.insert(
          name: employee.name,
          role: employee.role,
          startDate: employee.startDate.displayDate(),
          endDate: Value(enddate),
        ));
  }

  @override
  Future deleteEmployee(EmployeeModel employee) async {
    final database = EmployeeDatabase();
    await database.delete(database.employees).delete(EmployeesCompanion(
          id: Value(employee.id),
        ));
  }

  @override
  Stream<List<EmployeeModel>> getEmployees() {
    final database = EmployeeDatabase();
    final stream = database.select(database.employees).watch();
    return stream.map((rows) {
      return rows.map((row) {
        return EmployeeModel(
          id: row.id,
          name: row.name,
          role: row.role,
          startDate: DateTime.parse(row.startDate),
          endDate:
              row.endDate!.isNotEmpty ? DateTime.parse(row.endDate!) : null,
        );
      }).toList();
    });
  }

  @override
  Future updateEmployee(EmployeeModel employee) async {
    final database = EmployeeDatabase();
    await database.update(database.employees).replace(EmployeesCompanion(
          id: Value(employee.id),
          name: Value(employee.name),
          role: Value(employee.role),
          startDate: Value(employee.startDate.displayDate()),
          endDate: Value(employee.endDate?.displayDate() ?? ""),
        ));
  }
}
