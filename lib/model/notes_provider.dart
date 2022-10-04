import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/constants/app_strings.dart';
import 'task.dart';

class TasksProvider {
  static final box = Hive.box<Task>(AppStrings.tasksKey);
  static Future<void> addTask(Task task) async {
    await box.put(task.date, task);
  }

  // static Future<void> deleteTask(Task task) async => await task.delete();
  static Future<void> deleteTask(Task task) async {
    // await task.delete();
    await box.delete(task.date);
  }

  static ValueListenable<Box<Task>> listenable() => box.listenable();
}
