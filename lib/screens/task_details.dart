// useless file - made during tutorials lol

import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(child: Text("Tasks Screen")),
    );
  }
}
