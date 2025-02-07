import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/locator.dart';
import 'package:employee_app/data/data_source/local_datasource.dart';
import 'package:employee_app/presentation/screens/add_employee/add_employee_screen.dart';
import 'package:employee_app/presentation/screens/home/employees_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Stream<List<EmployeeModel>> _stream;

  @override
  void initState() {
    // _stream = objectbox.store
    //     .box<EmployeeModel>()
    //     .query()
    //     .watch(triggerImmediately: true)
    //     .map((query) => query.find());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBgColor,
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => AddEmployeeScreen()));
          },
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: kBlueColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/plus_icon.png',
                height: 18.h,
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('Employee List'),
        ),
        body: StreamBuilder(
          stream: locator<LocalDatasourceImpl>().getEmployees(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return Center(
                  child: SvgPicture.asset(
                    'assets/images/no_employee.svg',
                    height: 244.h,
                  ),
                );
              }
              var currentList = snapshot.data!
                  .where((element) => element.endDate == null)
                  .toList();
              var previousList = snapshot.data!
                  .where((element) => element.endDate != null)
                  .toList();
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    if (currentList.isNotEmpty)
                      EmployeesListview(
                        list: currentList,
                        title: 'Current Employees',
                      ),
                    if (previousList.isNotEmpty) SizedBox(height: 16.h),
                    if (previousList.isNotEmpty)
                      EmployeesListview(
                        list: previousList,
                        title: 'Previous Employees',
                      ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w, top: 12.h),
                      child: Text(
                        'Swipe left to delete',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: kGreyColor,
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
