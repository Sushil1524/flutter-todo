// useless file - made during tutorials lol

import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController task = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     TextField(
      //       controller: task,
      //       decoration: InputDecoration(
      //         hintText: "Enter your task",
      //         border: OutlineInputBorder(),
      //       ),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         // addTask();
      //       },
      //       child: Text("Add Task"),
      //     ),
      //   ],
      // ),
    );
  }
}
