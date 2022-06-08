import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Widgets/tasks_list.dart';
import '../Models/task_data.dart';
import '../constants.dart';

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
            shape: kAppBarShape,
            backgroundColor: kMainColor,
            actions: [
              Center(
                child: Padding(
                  padding: kDateRightPadding,
                  child: Text(
                    '${now.day}. ${now.month}. ${now.year.toString().substring(2)}.',
                    style: GoogleFonts.livvic(
                      textStyle: kTasksNumAndDateStyle,
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
                  kAppTitle,
                  style: GoogleFonts.livvic(
                    textStyle: kAppTitleStyle,
                  ),
                ),
                kTitleNumberOfTasksSpace,
                Text(
                  '${taskData.taskCount} Tasks',
                  style: GoogleFonts.livvic(
                    textStyle: kTasksNumAndDateStyle,
                  ),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: kBodyPadding,
            child: TaskList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape: kFABStyle,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, StateSetter newSetState) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: Padding(
                          padding: kSheetPadding,
                          child: Column(
                            children: [
                              TextField(
                                style: GoogleFonts.livvic(
                                  textStyle: kTextFieldTextStyle,
                                ),
                                onChanged: (value) {
                                  title = value;
                                },
                                textAlign: TextAlign.center,
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: kTextFieldHint,
                                  hintStyle: GoogleFonts.livvic(
                                    textStyle: kTextFieldHintStyle,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      kCategoryText,
                                      style: GoogleFonts.livvic(
                                        textStyle: kCategoryTextStyle,
                                      ),
                                    ),
                                  ),
                                  DropdownButton<String>(
                                      borderRadius: BorderRadius.circular(20.0),
                                      style: GoogleFonts.livvic(
                                        textStyle: kDropdownItemsTextStyle,
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
                                          kMainColor),
                                ),
                                onPressed: () {
                                  taskData.addTask(title, categoryValue);
                                  categoryValue = kDefaultDropdownValue;
                                  Navigator.pop(context);
                                },
                                child: kButtonAddTask,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  });
            },
            backgroundColor: Colors.green,
            elevation: 0.0,
            highlightElevation: 0.0,
            splashColor: Colors.green[800],
            mini: true,
            child: kFABIcon,
          ),
        );
      },
    );
  }
}
