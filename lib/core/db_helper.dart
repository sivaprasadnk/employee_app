import 'package:drift/drift.dart';

@DataClassName('Employee')
class Employees extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get role => text().withLength(min: 1, max: 50)();
  TextColumn get startDate => text().withLength(min: 1, max: 50)();
  TextColumn get endDate => text().nullable()();
}
