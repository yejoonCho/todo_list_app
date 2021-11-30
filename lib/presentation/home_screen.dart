import 'package:flutter/material.dart';
import 'package:todo_list_app/core/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List', style: AppTheme.textTheme.headline1),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
    );
  }
}
