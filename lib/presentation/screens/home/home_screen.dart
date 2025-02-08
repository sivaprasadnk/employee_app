import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_bloc.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_state.dart';
import 'package:employee_app/presentation/screens/add_employee/add_employee_screen.dart';
import 'package:employee_app/presentation/screens/home/employees_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
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
            width: 50.h,
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
          title: Text(
            'Employee List',
            style: TextStyle(
              color: kWhiteColor,
            ),
          ),
        ),
        body: BlocBuilder<EmpBloc, EmpState>(builder: (context, state) {
          var list = (state.employeesList ?? []);
          // list.sort((a, b) => a.id.compareTo(b.id));
          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (list.isEmpty) {
            return Center(
              child: SvgPicture.asset(
                'assets/images/no_employee.svg',
                height: 244.h,
              ),
            );
          }
          var currentList =
              list.where((element) => element.endDate == null).toList();
          var previousList =
              list.where((element) => element.endDate != null).toList();
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
                      fontSize: 16,
                      color: kGreyColor,
                    ),
                  ),
                )
              ],
            ),
          );
        }
            // },
            ));
  }
}
