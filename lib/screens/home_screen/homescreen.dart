import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/hive.dart';
import 'package:todo/components/todo_task.dart';
import 'package:todo/components/dialogue_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  final _myDb = Hive.openBox('myDb');

  List toDoLists = [
    ["testing", true, "", DateTime.now()],
    ["Flutter", false, "", DateTime.now()],
    ["Dart", false, "", DateTime.now()],
    ["Firebase", false, "", DateTime.now()],
  ];

  void checkBoxChanged(bool? value, int index) {
    if (value == null) return;
    setState(() {
      toDoLists[index][1] = !toDoLists[index][1];
    });
  }

  void saveNewTask() {
    // if (titleController.text.isEmpty) {
    //   return;
    // }
    setState(() {
      toDoLists.add([
        titleController.text,
        false,
        descController.text,
        DateTime.now(),
      ]);
      titleController.clear();
      descController.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return NewTask(
          titleController: titleController,
          descController: descController,
          // onSave: () => {},
          onSave: saveNewTask,
          onCancel: () => {Navigator.of(context).pop()},
        );
      },
    );
  }

  void deleteTaskController(int index) {
    setState(() {
      toDoLists.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Todo App Learning"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      // body: ListView(
      //   children: [
      //     TodoTask(
      //       taskName: "Sample Task",
      //       isCompleted: false,
      //       taskNotes: "This is a sample task.",
      //       dueDate: DateTime.now(),
      //       onChanged: () {
      //         // Handle checkbox state change
      //       },
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: toDoLists.length,
        itemBuilder: (context, index) {
          return TodoTask(
            taskName: toDoLists[index][0],
            isCompleted: toDoLists[index][1],
            taskNotes: "This is task ${index + 1}.",
            dueDate: toDoLists[index][3],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
            deleteTask: (context) {
              deleteTaskController(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/createtask');
          createNewTask();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
