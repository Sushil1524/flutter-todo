import 'package:flutter/material.dart';

import '../components/custom_button.dart';

class NewTask extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController descController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const NewTask({
    super.key,
    required this.titleController,
    required this.descController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 52, 50, 50),
      content: SizedBox(
        height: 350,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Create New Task",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter your task",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                focusColor: Colors.white,
                counterStyle: TextStyle(color: Colors.white),
              ),
            ),
            TextFormField(
              controller: descController,
              minLines: 6,
              maxLines: 12,
              decoration: InputDecoration(
                hintText: "Enter Description",
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                focusColor: Colors.black,
                counterStyle: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: "Save", onPressed: onSave),
                CustomButton(text: "Cancel", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
