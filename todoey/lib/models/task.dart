class Task {
  String title = "";
  bool checked = false;

  Task({required this.title});

  void flip() {
    checked = !checked;
  }
}
