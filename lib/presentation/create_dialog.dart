import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/core/app_theme.dart';
import 'package:todo_list_app/logic/bloc/task_bloc.dart';
import 'package:todo_list_app/logic/bloc/task_event.dart';
import 'package:todo_list_app/model/task.dart';

class CreateDialog extends StatefulWidget {
  final Task? task;
  CreateDialog({this.task});

  @override
  State<CreateDialog> createState() => _CreateDialogState();
}

class _CreateDialogState extends State<CreateDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.task?.content ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('할일 추가'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            height: 30,
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: AppTheme.lightPrimaryColor),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  final newTask = Task(
                    content: _textEditingController.text,
                    isAchieved: false,
                    time: DateTime.now(),
                  );
                  if (widget.task?.content == null) {
                    Provider.of<TaskBloc>(context, listen: false)
                        .add(CreateTask(task: newTask));
                  } else {
                    Provider.of<TaskBloc>(context, listen: false).add(
                        UpdateTask(oldTask: widget.task!, newTask: newTask));
                  }

                  Navigator.pop(context);
                  Provider.of<TaskBloc>(context, listen: false).add(ReadTask());
                },
                style: ElevatedButton.styleFrom(
                    primary: AppTheme.lightPrimaryColor),
                child: const Text('확인'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
