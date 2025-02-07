import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/core/locator.dart';
import 'package:employee_app/core/object_box.dart';
import 'package:employee_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      designSize: Size(428, 926),
      child: MaterialApp(
          title: 'Employee App',
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
    );
  }
}
