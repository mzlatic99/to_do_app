import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _tasksKey = 'task_list';
const String _categoryKey = 'category_list';

class _Task {
  final String name;
  final String category;
  bool isChecked;

  _Task({required this.name, required this.category, this.isChecked = false});

  void _toggleDone() {
    isChecked = !isChecked;
  }
}

class TaskData extends ChangeNotifier {
  List<_Task> _tasks = [];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String taskTitle, String taskCategory,
      {bool isChecked = false}) {
    _tasks.add(
        _Task(name: taskTitle, category: taskCategory, isChecked: isChecked));
    notifyListeners();
    save();
  }

  void updateTask(int index) {
    this._tasks[index]._toggleDone();
    notifyListeners();
    save(task: this._tasks[index]);
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    save();
  }

  String getTaskName(int index) {
    return _tasks[index].name;
  }

  String getTaskCategory(int index) {
    return _tasks[index].category;
  }

  bool isTaskChecked(int index) {
    return _tasks[index].isChecked;
  }

  List<String> get taskNames {
    return _tasks.map((e) => e.name).toList();
  }

  List<String> get taskCategories {
    return _tasks.map((e) => e.category).toList();
  }

  save({_Task? task}) async {
    final prefs = await SharedPreferences.getInstance();

    if (task != null) {
      prefs.setBool(task.name, task.isChecked);
      return;
    }

    final List<String> namesList = this.taskNames;
    prefs.setStringList(_tasksKey, namesList);

    final List<String> categoryList = this.taskCategories;
    prefs.setStringList(_categoryKey, categoryList);

    _tasks.forEach((task) {
      prefs.setBool(task.name, task.isChecked);
      prefs.setBool(task.category, task.isChecked);
    });
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_tasksKey) ?? [];
    final List<String> categories = prefs.getStringList(_categoryKey) ?? [];

    for (int i = 0; i < tasks.length; i++) {
      addTask(tasks[i], categories[i],
          isChecked: prefs.getBool(tasks[i]) ?? false);
    }
  }
}
