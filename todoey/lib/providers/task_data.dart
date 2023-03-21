import "package:flutter/foundation.dart";
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "Hi there"),
  ];

  void addTask(String title) {
    tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    tasks[index].flip();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.remove(tasks[index]);
    notifyListeners();
  }
}
