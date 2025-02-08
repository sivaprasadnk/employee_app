import 'package:employee_app/core/common_functions.dart';
import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/constants/roles.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/presentation/components/cancel_button.dart';
import 'package:employee_app/presentation/components/container_widget.dart';
import 'package:employee_app/presentation/components/custom_end_date_picker.dart';
import 'package:employee_app/presentation/components/custom_start_date_picker.dart';
import 'package:employee_app/presentation/components/role_list_item.dart';
import 'package:employee_app/presentation/components/save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EditEmployeeScreen extends StatefulWidget {
  const EditEmployeeScreen({
    super.key,
    required this.employeeModel,
    required this.index,
  });
  final EmployeeModel employeeModel;
  final int index;

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
                SaveButton(
                  callback: () async {
                    var model = EmployeeModel(
                      id: widget.employeeModel.id,
                      endDate: selectedEndDate,
                      name: textEditingController.text.trim(),
                      role: selectedRole ?? "",
                      startDate: selectedStartDate,
                      orderIndex: widget.employeeModel.orderIndex,
                    );
                    CommonFunctions.addorUpdateEmployee(
                      context: context,
                      model: model,
                      index: widget.index,
                    );
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
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () async {
                unfocus();
                CommonFunctions.deleteEmployee(
                  model: widget.employeeModel,
                  index: widget.index,
                );
                Navigator.pop(context);
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
                      GestureDetector(
                        onTap: () {
                          _focusNode.requestFocus();
                        },
                        child: SvgPicture.asset(
                          'assets/images/person.svg',
                          height: 24,
                          width: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          focusNode: _focusNode,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            isDense: true,
                            filled: false,
                            border: InputBorder.none,
                            hintText: 'Employee Name',
                            hintStyle: TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 23),
                GestureDetector(
                  onTap: () async {
                    unfocus();
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Material(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: employeeRoles.map((item) {
                                return RoleListItem(
                                  title: item,
                                  showDivider: employeeRoles.indexOf(item) !=
                                      employeeRoles.length - 1,
                                  callback: () {
                                    selectedRole = item;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                );
                              }).toList(),
                            ),
                          );
                        });
                  },
                  child: ContainerWidget(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/work.svg',
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
                        SvgPicture.asset(
                          'assets/images/arrow_down.svg',
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
                      child: GestureDetector(
                        onTap: () async {
                          unfocus();
                          await showDialog<DateTime>(
                            context: context,
                            builder: (context) => CustomStartDatePickerDialog(
                              initialDate: selectedStartDate,
                            ),
                          ).then((selectedDate) {
                            selectedStartDate = selectedDate!;
                            setState(() {});
                          });
                        },
                        child: ContainerWidget(
                          width: double.infinity,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/event.svg',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(width: 12),
                              selectedStartDate.isToday
                                  ? Text('Today')
                                  : Text(
                                      selectedStartDate.displayDate(),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(
                      'assets/images/arrow_right.svg',
                      height: 20,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          unfocus();
                          await showDialog<DateTime>(
                            context: context,
                            builder: (context) => CustomEndDatePickerDialog(
                              startDate: selectedStartDate,
                              endDate: selectedEndDate,
                            ),
                          ).then((selectedDate) {
                            selectedEndDate = selectedDate;
                            setState(() {});
                          });
                        },
                        child: ContainerWidget(
                          width: double.infinity,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/event.svg',
                                height: 24,
                                width: 24,
                              ),
                              SizedBox(width: 12),
                              selectedEndDate == null
                                  ? Text('No date')
                                  : Text(selectedEndDate!.displayDate()),
                            ],
                          ),
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
