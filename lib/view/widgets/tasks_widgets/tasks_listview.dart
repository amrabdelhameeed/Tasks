import 'package:flutter/material.dart';
import '../../../model/task.dart';
import 'task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({Key? key, required this.tasks, required this.scrollController}) : super(key: key);
  final List<Task> tasks;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      controller: scrollController,
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(
          task: tasks[index],
        );
      },
    );
  }
}
