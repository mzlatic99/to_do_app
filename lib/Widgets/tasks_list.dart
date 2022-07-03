import 'package:flutter/material.dart';
import 'package:to_do_app/constants.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import '../Models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onHorizontalDragEnd: (details) {
              taskData.deleteTask(index);
              ScaffoldMessenger.of(context).showSnackBar(
                kSnackBar,
              );
            },
            child: TaskTile(
              taskName: taskData.getTaskName(index),
              taskCategory: taskData.getTaskCategory(index),
              isChecked: taskData.isTaskChecked(index),
              checkBoxCallback: (checkboxState) {
                taskData.updateTask(index);
              },
            ),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
