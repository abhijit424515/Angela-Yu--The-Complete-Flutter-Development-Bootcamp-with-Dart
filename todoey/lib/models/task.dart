import 'package:realm/realm.dart'; // import realm package
part 'task.g.dart'; // declare a part file.

@RealmModel()
class _Task {
  String title = "";
  bool checked = false;

  // _Task({required this.title});

  void flip() {
    checked = !checked;
  }
}
