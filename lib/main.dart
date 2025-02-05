import 'package:employee_app/core/constants/colors.dart';
import 'package:employee_app/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          hintColor: kHintTextColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen());
  }
}
