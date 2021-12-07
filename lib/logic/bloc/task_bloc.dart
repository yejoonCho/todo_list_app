import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/logic/bloc/task_event.dart';
import 'package:todo_list_app/logic/bloc/task_state.dart';
import 'package:todo_list_app/model/task.dart';
import 'package:todo_list_app/repository/task_repository.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;
  TaskBloc({required this.taskRepository}) : super(TaskIsInitialized());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is CreateTask) {
      yield TaskIsLoading();
      taskRepository.addData(event.task);
    } else if (event is ReadTask) {
      yield TaskIsLoading();
      final List<Task> tasks = await taskRepository.fetchData();
      yield TaskIsLoaded(tasks: tasks);
    } else if (event is UpdateTask) {
    } else if (event is DeleteTask) {}
  }
}
