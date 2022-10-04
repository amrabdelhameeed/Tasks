import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../core/utils/size_config.dart';
import '../../../model/notes_provider.dart';
import '../../../model/task.dart';
import 'custom_scroll_bar.dart';
import '../../widgets/tasks_widgets/tasks_listview.dart';
import '../../../view_model/tasks_cubit/tasks_cubit.dart';
import '../../../view_model/tasks_cubit/tasks_state.dart';
import 'package:flutter/material.dart';

class TasksListViewWithScrollBar extends StatelessWidget {
  TasksListViewWithScrollBar({Key? key, required this.scrollController}) : super(key: key);
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      height: SizeConfig.screenHeight! * 0.55,
      width: SizeConfig.screenWidth,
      bottom: 0,
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          TasksCubit cubit = TasksCubit.get(context);
          final tasks = TasksProvider.box.values.toList();
          return CustomScrollbar(
            scrollController: scrollController,
            scrollableWidget: TasksListView(
              tasks: tasks.where((task) => task.date.substring(0, 10) == cubit.currentDate.toString().substring(0, 10)).toList(),
              scrollController: scrollController,
            ),
          );
        },
      ),
    );
  }
}

/*
TasksListView(
                tasks: tasks.where((task) => task.date.substring(0, 10) == cubit.currentDate.toString().substring(0, 10)).toList(),
                scrollController: scrollController,
              )
 */


/*

            final tasks = TasksProvider.box.values.toList();
            TasksCubit cubit = TasksCubit.get(context);
*/