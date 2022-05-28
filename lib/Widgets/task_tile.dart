import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    required this.taskName,
    required this.taskCategory,
    required this.isChecked,
    required this.checkBoxCallback,
  });
  final String taskName;
  final String taskCategory;
  final bool isChecked;
  final void Function(bool?) checkBoxCallback;

  int icon(String category) {
    switch (category) {
      case 'Work':
        return 1;
        break;
      case 'House':
        return 2;
        break;
      case 'Food':
        return 0;
        break;
      case 'Event':
        return 3;
        break;
      case 'School':
        return 4;
        break;
      case 'Journey':
        return 5;
        break;
      case 'Idea':
        return 6;
        break;
      case 'Gift':
        return 7;
        break;
      case 'Shopping':
        return 8;
        break;
      default:
        return 10;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.only(right: 16.0),
      activeColor: Colors.green,
      value: isChecked,
      onChanged: checkBoxCallback,
      title: Row(
        children: [
          Image(
            image: AssetImage(
              'icons/icon-${icon(taskCategory)}.png',
            ),
            width: 50,
            color: isChecked == true ? Colors.black : null,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                taskName,
                style: GoogleFonts.alata(
                  textStyle: TextStyle(
                      fontWeight:
                          isChecked ? FontWeight.normal : FontWeight.bold,
                      fontSize: 16.0,
                      decoration: isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
              Text(
                taskCategory,
                style: GoogleFonts.alata(
                  textStyle: TextStyle(
                    color: Colors.pink,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
