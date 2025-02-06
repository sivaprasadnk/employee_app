import 'package:objectbox/objectbox.dart';

@Entity()
class EmployeeModel {
  @Id()
  int id;
  String name;
  String role;
  DateTime startDate;
  DateTime? endDate;
  EmployeeModel({
    this.id = 0,
    required this.endDate,
    required this.name,
    required this.role,
    required this.startDate,
  });
}
