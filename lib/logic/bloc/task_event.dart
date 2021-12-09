import 'package:equatable/equatable.dart';
import 'package:todo_list_app/model/task.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTask extends TaskEvent {
  final Task task;
  CreateTask({required this.task});
}

class ReadTask extends TaskEvent {}

class UpdateTask extends TaskEvent {
  final Task oldTask;
  final Task newTask;
  UpdateTask({required this.oldTask, required this.newTask});
}

class DeleteTask extends TaskEvent {
  final Task task;
  DeleteTask({required this.task});
}
