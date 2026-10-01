import 'package:flutter/material.dart';
import 'package:todo/components/custom_button.dart';

// import '../components/custom_button.dart';

class TaskDetail extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final String taskNotes;
  final DateTime dueDate;

  const TaskDetail({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.taskNotes,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 52, 50, 50),
      content: SizedBox(
        height: 300,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Details",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Task Name:\n $taskName",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "Task Notes:\n $taskNotes",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              "Due Date:\n ${dueDate.toString().split(' ')[0]}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CustomButton(text: "Save", onPressed: onSave),
                CustomButton(
                  text: "Close",
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
