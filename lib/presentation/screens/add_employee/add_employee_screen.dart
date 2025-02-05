import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:employee_app/presentation/components/container_widget.dart';
import 'package:employee_app/presentation/components/role_list_item.dart';
import 'package:employee_app/presentation/components/save_button.dart';
import 'package:flutter/material.dart';

class AddEmployeeScreen extends StatelessWidget {
  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomSheet: Material(
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
              ContainerWidget(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/person.png',
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
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
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23),
              ContainerWidget(
                child: GestureDetector(
                  onTap: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Material(
                            borderRadius: BorderRadius.circular(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RoleListItem(
                                  title: 'Product Designer',
                                  callback: () {},
                                ),
                                RoleListItem(
                                  title: 'Flutter Developer',
                                  callback: () {},
                                ),
                                RoleListItem(
                                  title: 'QA Tester',
                                  callback: () {},
                                ),
                                RoleListItem(
                                  title: 'Product Owner',
                                  callback: () {},
                                  showDivider: false,
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/work.png',
                        height: 24,
                        width: 24,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Select role',
                          style: TextStyle(
                            color: kHintTextColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/arrow_down.png',
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 23),
              Row(
                children: [
                  Expanded(
                    child: ContainerWidget(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/event.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {},
                            child: Text('Today'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Image.asset(
                    'assets/images/arrow.png',
                    height: 20,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ContainerWidget(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/event.png',
                            height: 24,
                            width: 24,
                          ),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {},
                            child: Text('No date'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
