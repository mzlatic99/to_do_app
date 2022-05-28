import 'package:flutter/material.dart';
import 'package:to_do_app/Screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'Models/task_data.dart';

void main() {
  runApp(
    ToDoApp(),
  );
}

class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData()..load(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: TasksScreen.id,
        routes: {
          TasksScreen.id: (context) => TasksScreen(),
        },
      ),
    );
  }
}
