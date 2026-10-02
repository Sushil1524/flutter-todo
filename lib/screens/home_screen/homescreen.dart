import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/todo_task.dart';
import 'package:todo/components/dialogue_box.dart';
import 'package:todo/data/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myDb = Hive.box('myDb');
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    if (_myDb.get("TODOLISTS") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final titleController = TextEditingController();
  final descController = TextEditingController();

  // List toDoLists = [
  //   ["testing", true, "", DateTime.now()],
  //   ["Flutter", false, "", DateTime.now()],
  //   ["Dart", false, "", DateTime.now()],
  //   ["Firebase", false, "", DateTime.now()],
  // ];

  void checkBoxChanged(bool? value, int index) {
    if (value == null) return;
    setState(() {
      db.toDoLists[index][1] = !db.toDoLists[index][1];
    });
  }

  void saveNewTask() {
    // if (titleController.text.isEmpty) {
    //   return;
    // }
    setState(() {
      db.toDoLists.add([
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
      db.toDoLists.removeAt(index);
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
      //       addedDate: DateTime.now(),
      //       onChanged: () {
      //         // Handle checkbox state change
      //       },
      //     ),
      //   ],
      // ),
      body: ListView.builder(
        itemCount: db.toDoLists.length,
        itemBuilder: (context, index) {
          return TodoTask(
            taskName: db.toDoLists[index][0],
            isCompleted: db.toDoLists[index][1],
            taskNotes: db.toDoLists[index][2],
            addedDate: db.toDoLists[index][3],
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
