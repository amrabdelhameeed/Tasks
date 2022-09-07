// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/constants/app_images.dart';
import 'package:todo_task/core/constants/app_routes.dart';
import 'package:todo_task/core/constants/custom_clipper.dart';
import 'package:todo_task/model/task.dart';
import 'package:todo_task/core/packages/DatePickerTimelineFlutter-master/lib/date_picker_timeline.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/view/widgets/tasks_widgets/tasks_listview.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_cubit.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_state.dart';

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
            _backgroundCustomPainterAndItsWidgets(context),
            _tasksListViewWithScrollBar(),
          ],
        ),
      ),
    );
  }

/*


 */
  Positioned _tasksListViewWithScrollBar() {
    return Positioned(
      height: SizeConfig.screenHeight! * 0.55,
      width: SizeConfig.screenWidth,
      bottom: 0,
      child: _customScrollbar(
          scrollController: scrollController,
          scrollableWidget: BlocBuilder<TasksCubit, TasksState>(
            builder: (context, state) {
              TasksCubit cubit = TasksCubit.get(context);
              return TasksListView(tasks: Task.tasks.where((task) => task.date.substring(0, 12) == cubit.currentDate.toString().substring(0, 12)).toList(), scrollController: scrollController);
            },
          )),
    );
  }

  AdaptiveScrollbar _customScrollbar({required Widget scrollableWidget, required ScrollController scrollController}) {
    return AdaptiveScrollbar(
        sliderDefaultColor: AppColors.darkMainColor,
        sliderHeight: SizeConfig.defaultSize! * 10.5,
        width: SizeConfig.defaultSize! * 0.25,
        underSpacing: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3, vertical: SizeConfig.defaultSize! * 3),
        sliderSpacing: EdgeInsets.zero,
        position: ScrollbarPosition.left,
        controller: scrollController,
        child: scrollableWidget);
  }

  SizedBox _backgroundCustomPainterAndItsWidgets(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: Stack(
          children: [_drawerAndNotificationIcon(), _userAvatar(), _myTaskTextAndAddTaskButton(context)],
        ),
      ),
    );
  }

  Positioned _myTaskTextAndAddTaskButton(BuildContext context) {
    return Positioned(
      width: SizeConfig.screenWidth!,
      height: SizeConfig.defaultSize! * 19,
      top: SizeConfig.defaultSize! * 14,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _textsAndAddIcon(
              addIconOnTap: () {
                Navigator.pushNamed(context, AppRoutes.addTask);
              },
            ),
            _dateTimeLinePicker()
          ],
        ),
      ),
    );
  }

  Widget _dateTimeLinePicker() {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        TasksCubit cubit = TasksCubit.get(context);
        return Container(
          margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // note : i had to manually customize the DatePickerTimeLine package to get the design
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                height: SizeConfig.defaultSize! * 8,
                width: SizeConfig.defaultSize! * 7.5,
                selectionColor: AppColors.mainColor,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  cubit.changeDate(currentDate: date);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _textsAndAddIcon({required VoidCallback addIconOnTap}) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 9,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 2.8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Task',
                  style: TextStyle(fontSize: SizeConfig.defaultSize! * 3.2, fontWeight: FontWeight.bold),
                ),
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.defaultSize! * 5,
                  width: SizeConfig.defaultSize! * 5,
                  decoration: BoxDecoration(color: AppColors.mainColor, borderRadius: BorderRadius.circular(15)),
                  child: IconButton(
                    onPressed: addIconOnTap,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    iconSize: SizeConfig.defaultSize! * 3.5,
                  ),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(fontSize: SizeConfig.defaultSize! * 2.0, fontWeight: FontWeight.w500),
                ),
                BlocBuilder<TasksCubit, TasksState>(
                  builder: (context, state) {
                    TasksCubit cubit = TasksCubit.get(context);
                    return Text(
                      DateFormat('EEEE, d MMMM').format(cubit.currentDate),
                      style: TextStyle(color: AppColors.mainColor, fontSize: SizeConfig.defaultSize! * 1.1, fontWeight: FontWeight.w400),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Positioned _userAvatar() {
    return Positioned(
        right: SizeConfig.defaultSize! * 3,
        top: SizeConfig.defaultSize! * 2.1,
        child: CircleAvatar(
          maxRadius: SizeConfig.defaultSize! * 2.7,
          backgroundImage: AssetImage(AppImages.cooking),
        ));
  }

  Positioned _drawerAndNotificationIcon() {
    return Positioned(
        top: SizeConfig.defaultSize! * 2,
        left: SizeConfig.defaultSize! * 2,
        child: Row(
          children: [
            //drawer icon
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort_rounded),
              iconSize: SizeConfig.defaultSize! * 3.5,
            ),
            //notification icon with the red circle
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_rounded, color: AppColors.mainColor),
                  iconSize: SizeConfig.defaultSize! * 3.5,
                ),
                Positioned(
                  bottom: SizeConfig.defaultSize! * 1.4,
                  left: SizeConfig.defaultSize! * 1.7,
                  child: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 13,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
