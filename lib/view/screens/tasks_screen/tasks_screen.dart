import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/app_controllers.dart';
import '../../../core/utils/size_config.dart';
import '../../methods/tasks_screen_methods/background_custom_painter_with_its_widget.dart';
import '../../methods/tasks_screen_methods/tasks_listview_with_scroll_bar.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundCustomPainterAndItsWidgets(),
            TasksListViewWithScrollBar(scrollController: AppControllers.scrollController),
          ],
        ),
      ),
    );
  }
}
