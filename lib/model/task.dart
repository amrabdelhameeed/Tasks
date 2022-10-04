import 'package:hive/hive.dart';
import '../core/models/filter_model.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String startTime;
  @HiveField(3)
  final String endTime;
  @HiveField(4)
  late String date;
  @HiveField(5)
  final int categoryIndex;

  Task({required this.title, required this.description, required this.startTime, required this.endTime, required this.date, required this.categoryIndex});
  static List<Task> tasks = [
    Task(
        title: 'title',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.first.index),
    Task(
        title: 'title2',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.last.index),
    Task(
        title: 'title3',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.first.index),
    Task(
        title: 'title4',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.last.index),
    Task(
        title: 'title5',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.first.index),
    Task(
        title: 'title6',
        description: 'Discuss All Question About New Project',
        startTime: '10:00 PM',
        endTime: '10:00 AM',
        date: DateTime.now().toString(),
        categoryIndex: FilterModel.filters.last.index)
  ];
}
