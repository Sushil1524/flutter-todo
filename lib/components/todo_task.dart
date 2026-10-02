import 'package:flutter/material.dart';
import 'package:todo/components/task_detail.dart';

class TodoTask extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final String taskNotes;
  final DateTime addedDate;

  final Function(BuildContext)? deleteTask;
  final Function(bool?)? onChanged;

  void showTaskDetails(context) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDetail(
          taskName: taskName,
          isCompleted: isCompleted,
          taskNotes: taskNotes,
          addedDate: addedDate,
        );
      },
    );
  }

  const TodoTask({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.taskNotes,
    required this.addedDate,
    required this.deleteTask,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Checkbox(
              value: isCompleted,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              checkColor: Colors.black,
              activeColor: Colors.blue,
              side: const BorderSide(color: Colors.white),
              onChanged: onChanged,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(context, '/taskdetails');
                  showTaskDetails(context);
                },
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 3,
                    // decorationStyle: TextDecorationStyle.double,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: deleteTask != null ? () => deleteTask!(context) : null,
              style: IconButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.zero,
              ),
              icon: const Icon(Icons.delete, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
