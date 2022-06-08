import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/constants.dart';

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
      case 'House':
        return 2;
      case 'Food':
        return 0;
      case 'Event':
        return 3;
      case 'School':
        return 4;
      case 'Journey':
        return 5;
      case 'Idea':
        return 6;
      case 'Gift':
        return 7;
      case 'Shopping':
        return 8;
      default:
        return 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: kContentPadding,
      activeColor: kMainColor,
      value: isChecked,
      onChanged: checkBoxCallback,
      title: Row(
        children: [
          Image(
            image: AssetImage(
              'icons/icon-${icon(taskCategory)}.png',
            ),
            width: 50.0,
            color: isChecked == true ? Colors.black : null,
          ),
          kTileIconTextSpace,
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
                  textStyle: kTaskCategoryTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
