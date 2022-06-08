import 'package:flutter/material.dart';

const kAppTitle = 'ToDo';
const kMainColor = Colors.green;

//Tasks screen
const kAppBarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(20.0),
  ),
);

const kAppTitleStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kTitleNumberOfTasksSpace = SizedBox(
  width: 6.0,
);
const kTasksNumAndDateStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.w400,
  fontSize: 12.0,
);
const kDateRightPadding = EdgeInsets.only(right: 24.0);
const kBodyPadding = EdgeInsets.all(16.0);
const kFABStyle = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);

const kSheetPadding = EdgeInsets.all(20.0);
const kTextFieldTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
  color: Color(0xFF43A047),
);
const kTextFieldHint = 'Title';
const kTextFieldHintStyle = TextStyle(
  fontSize: 14.0,
);
const kCategoryText = 'Category';
const kCategoryTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14.0,
);
const kDropdownItemsTextStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.black,
);
const kDefaultDropdownValue = 'Custom';
const kButtonAddTask = Padding(
  padding: EdgeInsets.all(12.0),
  child: Text('Add task'),
);
const kFABIcon = Icon(
  Icons.add_rounded,
  size: 28.0,
);

//Task tile
const kContentPadding = EdgeInsets.only(right: 16.0);
const kTileIconTextSpace = SizedBox(
  width: 10,
);
const kTaskCategoryTextStyle = TextStyle(
  color: Colors.pink,
);

//Task list
const kSnackBar = SnackBar(
  content: Text('Task dismissed'),
  backgroundColor: Colors.green,
);
