import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Widgets/tasks_list.dart';
import '../Models/task_data.dart';

class TasksScreen extends StatelessWidget {
  static const String id = 'tasks_screen';

  late String title;
  final now = DateTime.now();
  String categoryValue = 'Custom';

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
              ),
            ),
            backgroundColor: Colors.green,
            actions: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
                    '${now.day}. ${now.month}. ${now.year.toString().substring(2)}.',
                    style: GoogleFonts.livvic(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  'ToDo',
                  style: GoogleFonts.livvic(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  '${taskData.taskCount} Tasks',
                  style: GoogleFonts.livvic(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: TaskList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, StateSetter newSetState) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextField(
                                style: GoogleFonts.livvic(
                                  textStyle: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[600],
                                  ),
                                ),
                                onChanged: (value) {
                                  title = value;
                                },
                                textAlign: TextAlign.center,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: 'Title',
                                  hintStyle: GoogleFonts.livvic(
                                    textStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Category',
                                      style: GoogleFonts.livvic(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(20.0),
                                      style: GoogleFonts.livvic(
                                        textStyle: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      items: <String>[
                                        'Custom',
                                        'School',
                                        'Work',
                                        'House',
                                        'Event',
                                        'Shopping',
                                        'Journey',
                                        'Gift',
                                        'Idea',
                                        'Food'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      value: categoryValue,
                                      onChanged: (String? newValue) {
                                        newSetState(() {
                                          categoryValue = newValue!;
                                        });
                                      }),
                                ],
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                onPressed: () {
                                  taskData.addTask(title, categoryValue);
                                  categoryValue = 'Custom';
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text('Add task'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            },
            child: Icon(
              Icons.add_rounded,
              size: 28.0,
            ),
            backgroundColor: Colors.green,
            elevation: 0.0,
            highlightElevation: 0.0,
            splashColor: Colors.green[800],
            mini: true,
          ),
        );
      },
    );
  }
}
