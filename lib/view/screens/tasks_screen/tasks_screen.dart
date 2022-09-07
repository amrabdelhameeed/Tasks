import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/background_custom_painter_with_its_widget.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/tasks_listview_with_scroll_bar.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            backgroundCustomPainterAndItsWidgets(context),
            tasksListViewWithScrollBar(scrollController: scrollController),
          ],
        ),
      ),
    );
  }
}
