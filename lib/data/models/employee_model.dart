import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeModel {
  @Id()
  final int id;
  final String name;
  final String role;
  final DateTime startDate;
  final DateTime? endDate;
  EmployeeModel({
    this.id = 0,
    required this.endDate,
    required this.name,
    required this.role,
    required this.startDate,
  });
}
