import 'package:flutter/material.dart';
import '../../../model/notes_provider.dart';
import '../../../view_model/tasks_cubit/tasks_cubit.dart';
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
        return Dismissible(
          key: Key(tasks[index].date),
          onDismissed: (direction) {
            TasksCubit.get(context).deleteTask(tasks[index]);
          },
          child: TaskItem(
            task: tasks[index],
          ),
        );
      },
    );
  }
}
