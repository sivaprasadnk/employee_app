import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:employee_app/core/db_helper.dart';
import 'package:path_provider/path_provider.dart';

part 'emp_db.g.dart';

@DriftDatabase(tables: [Employees])
class EmployeeDatabase extends _$EmployeeDatabase {
  EmployeeDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
  // Add other DAO functions below
}
