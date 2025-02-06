import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/extensions/datetime_extensions.dart';
import 'package:employee_app/data/models/employee_model.dart';
import 'package:employee_app/main.dart';
import 'package:employee_app/presentation/screens/add_employee/add_employee_screen.dart';
import 'package:employee_app/presentation/screens/edit_employee/edit_employee_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Stream<List<EmployeeModel>> _stream;

  @override
  void initState() {
    _stream = objectbox.store
        .box<EmployeeModel>()
        .query()
        .watch(triggerImmediately: true)
        .map((query) => query.find());
    super.initState();
  }

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
        body: StreamBuilder(
          stream: _stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: Image.asset(
                    'assets/images/no_employee.png',
                    height: 244,
                  ),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      'Current employees',
                      style: TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ColoredBox(
                    color: kWhiteColor,
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: kBorderColor,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var item = snapshot.data![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => EditEmployeeScreen(
                                          employeeModel: item)));
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 6.h),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  item.role,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color.fromRGBO(148, 156, 158, 1),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  "From ${item.startDate.displayDate()}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Color.fromRGBO(148, 156, 158, 1),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
              // return Center(
              //   child: Image.asset(
              //     'assets/images/no_employee.png',
              //     height: 244,
              //   ),
              // );
            }
          },
        )
    );
  }
}
