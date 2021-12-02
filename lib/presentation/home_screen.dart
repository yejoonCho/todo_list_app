import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/logic/bloc/task_bloc.dart';
import 'package:todo_list_app/logic/bloc/task_event.dart';
import 'package:todo_list_app/logic/bloc/task_state.dart';
import 'package:todo_list_app/model/task.dart';
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
    BlocProvider.of<TaskBloc>(context).add(ReadTask());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add, size: 32),
        backgroundColor: Colors.grey.shade500,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const SizedBox(height: 50),
              CircularPercentIndicator(
                percent: 0.4,
                center: Text('40%', style: AppTheme.title1),
                radius: 150,
                lineWidth: 10,
                animation: true,
                animationDuration: 5000,
              ),
              const SizedBox(height: 50),
              Expanded(
                child: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    if (state is TaskIsLoading) {
                      return Container();
                    } else if (state is TaskIsLoaded) {
                      final List<Task> todos = state.tasks;
                      return ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                                Text(
                                  todos[index].content,
                                  style: AppTheme.content1,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Icon(Icons.more_horiz),
                                ),
                              ],
                            );
                          });
                    } else if (state is TaskIsInitialized) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
