import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/core/locator.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/domain/use_cases/add_update_employee.dart';
import 'package:employee_app/domain/use_cases/delete_employee.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:employee_app/presentation/components/container_widget.dart';
import 'package:employee_app/presentation/components/custom_end_date_picker.dart';
import 'package:employee_app/presentation/components/custom_start_date_picker.dart';
import 'package:employee_app/presentation/components/role_list_item.dart';
import 'package:employee_app/presentation/components/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({
    super.key,
    required this.employeeModel,
  });
  final EmployeeModel employeeModel;

  @override
  State<EditEmployeeScreen> createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  @override
  initState() {
    selectedRole = widget.employeeModel.role;
    textEditingController.text = widget.employeeModel.name;
    selectedStartDate = widget.employeeModel.startDate;
    selectedEndDate = widget.employeeModel.endDate;
    setState(() {});
    super.initState();
  }

  String? selectedRole;
  DateTime selectedStartDate = DateTime.now();
  DateTime? selectedEndDate;

  final FocusNode _focusNode = FocusNode();

  TextEditingController textEditingController = TextEditingController();

  unfocus() {
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unfocus();
      },
      child: Scaffold(
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
                SaveButton(
                  callback: () async {
                    await locator<AddOrUpdateEmployee>()
                        .call(
                      EmployeeModel(
                        id: widget.employeeModel.id,
                        endDate: selectedEndDate,
                        name: textEditingController.text,
                        role: selectedRole!,
                        startDate: selectedStartDate,
                      ),
                    )
                        .then((_) {
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    });
                  },
                ),
                SizedBox(width: 16),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Edit Employee Details',
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                await locator<DeleteEmployee>()
                    .call(widget.employeeModel)
                    .then((_) {
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                });
              },
              child: Icon(Icons.delete),
            ),
            SizedBox(width: 16),
          ],
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
                            focusNode: _focusNode,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: 'Employee Name',
                              hintStyle: TextStyle(
                                color: kGreyColor,
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
                      unfocus();
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Material(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RoleListItem(
                                    title: 'Product Designer',
                                    callback: () {
                                      selectedRole = 'Product Designer';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                  RoleListItem(
                                    title: 'Flutter Developer',
                                    callback: () {
                                      selectedRole = 'Flutter Developer';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                  RoleListItem(
                                    title: 'QA Tester',
                                    callback: () {
                                      selectedRole = 'QA Tester';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                  RoleListItem(
                                    title: 'Product Owner',
                                    callback: () {
                                      selectedRole = 'Product Owner';
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
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
                            selectedRole ?? 'Select role',
                            style: TextStyle(
                              color: selectedRole == null
                                  ? kGreyColor
                                  : kBlackColor,
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
                              onTap: () async {
                                await showDialog<DateTime>(
                                  context: context,
                                  builder: (context) =>
                                      CustomStartDatePickerDialog(
                                    initialDate: selectedStartDate,
                                  ),
                                ).then((selectedDate) {
                                  selectedStartDate = selectedDate!;
                                  setState(() {});
                                });
                              },
                              child: selectedStartDate.isToday
                                  ? Text('Today')
                                  : Text(
                                      selectedStartDate.displayDate(),
                                    ),
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
                              onTap: () async {
                                await showDialog<DateTime>(
                                  context: context,
                                  builder: (context) =>
                                      CustomEndDatePickerDialog(
                                    startDate: selectedStartDate,
                                    endDate: selectedEndDate,
                                  ),
                                ).then((selectedDate) {
                                  selectedEndDate = selectedDate;
                                  setState(() {});
                                });
                              },
                              child: selectedEndDate == null
                                  ? Text('No date')
                                  : Text(selectedEndDate!.displayDate()),
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
      ),
    );
  }
}
