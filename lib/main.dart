import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/locator.dart';
import 'package:employee_app/core/object_box.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_bloc.dart';
import 'package:employee_app/presentation/bloc/employee_bloc/emp_event.dart';
import 'package:employee_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

late ObjectBox objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  objectbox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmpBloc>(
            create: (_) => EmpBloc()
              ..add(
                GetEmployeesEvent(),
              )),
      ],
      child: ScreenUtilInit(
        designSize: Size(428, 926),
        child: MaterialApp(
            title: 'Employee App',
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: kBlueColor,
                foregroundColor: kWhiteColor,
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              scaffoldBackgroundColor: kWhiteColor,
              hintColor: kGreyColor,
              colorScheme: ColorScheme.fromSeed(seedColor: kBlueColor),
              useMaterial3: true,
            ),
            home: const HomeScreen()),
      ),
    );
  }
}
