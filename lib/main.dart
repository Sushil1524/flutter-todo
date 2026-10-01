import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/style.dart';
import 'screens/home_screen/homescreen.dart';
import '../screens/create_task.dart';
import '../screens/task_details.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('myDb');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/createtask': (context) => CreateTask(),
        '/taskdetails': (context) => TaskDetails(),
      },
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          //   // backgroundColor: colorScheme.primary,
          backgroundColor: Colors.deepPurple,
          foregroundColor: colorScheme.onPrimary,
          titleTextStyle: appBarTextStyle.copyWith(
            color: colorScheme.onPrimary,
          ),
        ),
        // textTheme: TextTheme(
        //   titleLarge: titletextStyle,
        //   bodySmall: bodyTextStyle,
        // ),
        // textTheme:TextTheme(),
        // scaffoldBackgroundColor: Colors.white,
        colorScheme: colorScheme,
      ),
    );
  }
}
