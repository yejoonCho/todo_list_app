import 'package:equatable/equatable.dart';
import 'package:todo_list_app/model/task.dart';

abstract class TaskState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TaskIsInitialized extends TaskState {}

class TaskIsLoading extends TaskState {}

class TaskIsLoaded extends TaskState {
  final List<Task> tasks;
  TaskIsLoaded({required this.tasks});
}

class TaskIsError extends TaskState {}
