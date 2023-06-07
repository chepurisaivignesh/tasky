import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/presentation/screens/view_task_screen.dart';

import 'presentation/screens/add_task_screen.dart';
import 'presentation/screens/edit_task_screen.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasky',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.getFont('Ubuntu').fontFamily,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
          case '/tasks':
            return MaterialPageRoute(
              builder: (context) => TasksScreen(),
            );
          case '/add-task':
            return MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            );
          case '/edit-task':
            return MaterialPageRoute(
              builder: (context) => EditTaskScreen(),
              settings: settings,
            );
          case '/view-task':
            return MaterialPageRoute(
              builder: (context) => ViewTaskScreen(),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (context) => HomeScreen(),
            );
        }
      },
    );
  }
}
