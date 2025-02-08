import 'package:employee_app/core/common_functions.dart';
import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/presentation/screens/edit_employee/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EmployeesListview extends StatelessWidget {
  const EmployeesListview({
    super.key,
    required this.list,
    required this.title,
  });
  final List<EmployeeModel> list;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              color: kBlueColor,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        ColoredBox(
          color: kWhiteColor,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 1.h,
                color: kBgColor,
              );
            },
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              var item = list[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) async {
                        CommonFunctions.deleteEmployee(
                          model: item,
                          index: index,
                        );
                      },
                      backgroundColor: kRedColor,
                      foregroundColor: kWhiteColor,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  EditEmployeeScreen(
                                    employeeModel: item,
                                    index: index,
                                  )));
                    },
                    child: ColoredBox(
                      color: kWhiteColor,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            Text(
                              item.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              item.role,
                              style: TextStyle(
                                fontSize: 16,
                                color: kGreyColor,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            if (item.endDate == null)
                              Text(
                                "From ${item.startDate.displayDate()}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGreyColor,
                                ),
                              )
                            else
                              Text(
                                "${item.startDate.displayDate()} - ${item.endDate!.displayDate()}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(148, 156, 158, 1),
                                ),
                              ),
                            SizedBox(height: 16.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
