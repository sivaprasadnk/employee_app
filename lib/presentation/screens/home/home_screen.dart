import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/presentation/screens/add_employee/add_employee_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddEmployeeScreen()));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kBlueColor,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/plus_icon.png',
              height: 18,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/no_employee.png',
          height: 244,
        ),
      ),
    );
  }
}
