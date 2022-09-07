import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_task/core/constants/app_routes.dart';
import 'package:todo_task/core/packages/DatePickerTimelineFlutter-master/lib/date_picker_timeline.dart';
import 'package:todo_task/core/packages/DatePickerTimelineFlutter-master/lib/extra/color.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_cubit.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_state.dart';

Positioned dateTimeLinePickerAndAddButtonWithTexts(BuildContext context) {
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
