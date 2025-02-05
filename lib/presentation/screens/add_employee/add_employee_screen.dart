import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:employee_app/presentation/components/save_button.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: kWhiteColor,
        elevation: 10,
        child: SizedBox(
          height: 64,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CancelButton(),
              SizedBox(width: 16),
              SaveButton(),
              SizedBox(width: 16),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Add Employee Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: kBorderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/person.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: 'Employee Name',
                            hintStyle: TextStyle(
                              color: kHintTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 23),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: kBorderColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/work.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Employee Name',
                            hintStyle: TextStyle(
                              color: kHintTextColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
