import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/logic/bloc/task_bloc.dart';
import 'package:todo_list_app/logic/bloc/task_event.dart';
import 'package:todo_list_app/logic/bloc/task_state.dart';
import 'package:todo_list_app/model/task.dart';
import 'package:todo_list_app/presentation/create_dialog.dart';
import 'package:todo_list_app/presentation/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskBloc>(context, listen: false).add(ReadTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const CreateDialog(),
          );
        },
        child: const Icon(Icons.add, size: 32),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskIsLoading) {
              return const CircularProgressIndicator();
            } else if (state is TaskIsLoaded) {
              final List<Task> tasks = state.tasks;
              return ListView(
                children: [
                  const SizedBox(height: 40),
                  CircularPercentIndicator(
                    percent: 0.4,
                    center: Text('40%', style: AppTheme.title1),
                    radius: 150,
                    lineWidth: 10,
                    animation: true,
                    animationDuration: 5000,
                  ),
                  const SizedBox(height: 50),
                  for (int i = 0; i < tasks.length; i++)
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Text(
                          tasks[i].content,
                          style: AppTheme.content1,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(Icons.more_horiz),
                        ),
                      ],
                    )
                ],
              );
            } else if (state is TaskIsError) {
              return const Text('데이터를 불러올 수 없음');
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
