import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoLists = [];

  final _myDb = Hive.box('myDb');

  void createInitialData() {
    toDoLists = [
      // Initial data for the to-do list
      // ["testing", true, "", DateTime.now()],
      // ["Flutter", false, "", DateTime.now()],
      // ["Dart", false, "", DateTime.now()],s
      // ["Firebase", false, "", DateTime.now()],
    ];
  }

  void loadData() {
    toDoLists = _myDb.get("TODOLISTS");
  }

  void saveData() {
    _myDb.put("TODOLISTS", toDoLists);
  }
}
