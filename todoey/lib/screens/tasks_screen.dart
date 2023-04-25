import "dart:convert";

import "package:flutter/material.dart";
import "package:realm/realm.dart";
import "package:todoey/models/task.dart";
import "package:todoey/providers/task_data.dart";
import "package:todoey/screens/add_task_screen.dart";
import "package:provider/provider.dart";
import "package:todoey/widgets/task_tile.dart";
import 'package:google_sign_in/google_sign_in.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final GoogleSignIn _gsi = GoogleSignIn();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      RealmResults<Task> tasks = taskData.tasks;

      return Scaffold(
        backgroundColor: Colors.lightBlue,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              backgroundColor: Colors.white,
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTaskScreen(),
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _gsi.signIn().then((value) async {
                            await users
                                .where('email',
                                    isEqualTo: value?.email.toString())
                                .get()
                                .then((value) {
                              for (var element in value.docs) {
                                users.doc(element.id).delete();
                              }
                            });

                            await users.add({
                              "email": value?.email.toString(),
                              "tasks": tasks
                                  .map((x) => jsonEncode({
                                        "title": x.title,
                                        "checked": x.checked.toString()
                                      }))
                                  .toList()
                                  .toString(),
                            }).then((value) {
                              debugPrint(
                                  "------------------ 200 OK ------------------");
                            }).catchError((error) {
                              debugPrint(
                                  "------------------ Failed to add user: $error ------------------");
                            });
                          });
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(
                            Icons.upload,
                            size: 30,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _gsi.signIn().then((value) async {
                            await users
                                .where('email',
                                    isEqualTo: value?.email.toString())
                                .get()
                                .then((QuerySnapshot qs) {
                              dynamic newTasks = jsonDecode(qs.docs[0]["tasks"])
                                  .map((x) => Task(
                                      title: x["title"],
                                      checked: x["checked"] == "true"))
                                  .toList();
                              debugPrint(
                                  newTasks.map((x) => x.checked).toString());

                              for (int i = tasks.length - 1; i >= 0; i--) {
                                taskData.deleteTask(i);
                              }

                              for (int i = 0; i < newTasks.length; i++) {
                                taskData.addTaskAsObject(newTasks[i]);
                              }
                            });
                          });
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(
                            Icons.download,
                            size: 30,
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Todoey",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${tasks.length} Tasks",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => TaskTile(index: index),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
