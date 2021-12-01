import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/presentation/home_screen.dart';
import 'package:todo_list_app/presentation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'todo_list_app',
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
