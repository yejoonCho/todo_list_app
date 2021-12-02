import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/logic/bloc/task_bloc.dart';
import 'package:todo_list_app/logic/notifier/login_notifier.dart';
import 'package:todo_list_app/presentation/login_screen.dart';
import 'package:todo_list_app/repository/task_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginNotifier>(
        create: (context) => LoginNotifier(),
      ),
      BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(taskRepository: TaskRepository()),
      )
    ],
    child: const MyApp(),
  ));
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
