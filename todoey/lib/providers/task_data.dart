import "package:flutter/foundation.dart";
import 'package:realm/realm.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  late Realm realm;
  late RealmResults<Task> tasks;

  TaskData() {
    final config = Configuration.local([Task.schema]);
    realm = Realm(config);
    tasks = realm.all<Task>();
  }

  void addTask(String title) {
    realm.write(() {
      realm.add(Task(title: title));
    });
    notifyListeners();
  }

  void toggleTaskStatus(int index) {
    realm.write(() {
      tasks[index].checked = !tasks[index].checked;
    });
    notifyListeners();
  }

  void deleteTask(int index) {
    realm.write(() {
      realm.delete(tasks[index]);
    });
    notifyListeners();
  }
}
