// import 'package:objectbox/objectbox.dart';

// @Entity()
class EmployeeModel {
  // @Id()
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

  factory EmployeeModel.fromMap(Map<String, dynamic> map) {
    return EmployeeModel(
      id: map['id'],
      name: map['name'],
      role: map['role'],
      startDate: map['start_date'],
      endDate: map['end_date'],
    );
  }
}
