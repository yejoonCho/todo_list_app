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
  final Task task;
  UpdateTask({required this.task});
}

class DeleteTask extends TaskEvent {}
