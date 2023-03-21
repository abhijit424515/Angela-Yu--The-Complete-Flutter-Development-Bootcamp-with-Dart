import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/providers/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        Task task = taskData.tasks[index];
        return ListTile(
          trailing: Checkbox(
            activeColor: Colors.lightBlue,
            value: task.checked,
            onChanged: (bool? newValue) {
              taskData.toggleTaskStatus(index);
            },
          ),
          title: Text(
            task.title,
            style: TextStyle(
              decoration:
                  task.checked == true ? TextDecoration.lineThrough : null,
              color: task.checked == true ? Colors.black38 : Colors.black,
            ),
          ),
          onLongPress: () {
            taskData.deleteTask(index);
          },
        );
      },
    );
  }
}
