import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/model/task.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/custom_scroll_bar.dart';
import 'package:todo_task/view/widgets/tasks_widgets/tasks_listview.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_cubit.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_state.dart';

Positioned tasksListViewWithScrollBar({required ScrollController scrollController}) {
  return Positioned(
    height: SizeConfig.screenHeight! * 0.55,
    width: SizeConfig.screenWidth,
    bottom: 0,
    child: customScrollbar(
        scrollController: scrollController,
        scrollableWidget: BlocBuilder<TasksCubit, TasksState>(
          builder: (context, state) {
            TasksCubit cubit = TasksCubit.get(context);
            return TasksListView(tasks: Task.tasks.where((task) => task.date.substring(0, 12) == cubit.currentDate.toString().substring(0, 12)).toList(), scrollController: scrollController);
          },
        )),
  );
}
