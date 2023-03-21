import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:todoey/providers/task_data.dart";

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String value = "";
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          const Text(
            "Add task",
            style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 25,
            ),
          ),
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            onChanged: (newValue) {
              value = newValue;
            },
          ),
          GestureDetector(
            onTap: () {
              Provider.of<TaskData>(context, listen: false).addTask(value);
              Navigator.pop(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlue,
              ),
              child: const Center(
                child: Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
