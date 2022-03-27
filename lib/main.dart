import 'package:final_year_project_mobile_app/pages/home.dart';
import 'package:final_year_project_mobile_app/pages/login.dart';
import 'package:final_year_project_mobile_app/pages/signup.dart';
import 'package:final_year_project_mobile_app/theme/apptheme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const SignupPage(),
    );
  }
}
