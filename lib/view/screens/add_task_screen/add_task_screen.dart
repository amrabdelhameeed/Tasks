// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/models/filter_model.dart';
import 'package:todo_task/core/widgets/custom_elevated_button.dart';
import 'package:todo_task/model/task.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/core/widgets/custom_snackbar.dart';
import 'package:todo_task/core/widgets/filters%20widget/filter_listview.dart';
import 'package:todo_task/core/widgets/space.dart';
import 'package:todo_task/core/widgets/widget_with_padding.dart';
import 'package:todo_task/view/widgets/add_task_widget/custom_app_bar.dart';
import 'package:todo_task/view/widgets/add_task_widget/title_with_text_form_field.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_cubit.dart';
import 'package:todo_task/view_model/tasks_cubit/tasks_state.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TasksCubit cubit = TasksCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              WidgetWithPadding(
                  widget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _createNewTaskTextAndNotesIcon(),
                  VerticalSpace(value: 2.5),
                  _inputTaskName(cubit),
                  VerticalSpace(value: 3),
                  _selectCategoryTextAndSeeAllButton(seeAllonTap: () {}),
                ],
              )),
              _filtersListView(),
              WidgetWithPadding(
                  widget: Column(
                children: [
                  _dateTextFormFieldAndDateIcon(context, cubit),
                  VerticalSpace(value: 2),
                  _startTimeAndEndTime(context, cubit),
                  VerticalSpace(value: 2),
                  _description(cubit),
                  VerticalSpace(value: 1),
                  BlocListener<TasksCubit, TasksState>(
                    listener: (context, state) {
                      if (state is TaskAddedState) {
                        Navigator.pop(context);
                        CustomSnackBar.showSnackBar(context: context, text: 'Task Added');
                      }
                    },
                    child: _createTaskButton(
                      onPressed: () {
                        DateTime date = cubit.dateFormat.parse(cubit.dateController.text);
                        date = DateTime(DateTime.now().year, date.month, date.day);
                        cubit.addtask(Task(
                            title: cubit.taskNameController.text,
                            description: cubit.taskDescriptionController.text,
                            startTime: cubit.timeStartController.text,
                            endTime: cubit.timeEndController.text,
                            date: date.toString(),
                            category: cubit.currentFilter));
                      },
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  Container _filtersListView() => Container(padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 2), child: FilterListView(filters: FilterModel.filters));

  CustomElevatedButton _createTaskButton({required VoidCallback onPressed}) {
    return CustomElevatedButton(
      title: 'Create Task',
      onPressed: onPressed,
    );
  }

  TitleWithTextFormField _description(TasksCubit cubit) => TitleWithTextFormField(title: 'Description', controller: cubit.taskDescriptionController);

  Row _startTimeAndEndTime(BuildContext context, TasksCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: TitleWithTextFormField(
            title: 'Start Time',
            isTime: true,
            controller: TasksCubit.get(context).timeStartController,
            onTap: () {
              _showDTimePicker(context, cubit, true);
            },
          ),
        ),
        HorizontalSpace(value: 6),
        Expanded(
          child: TitleWithTextFormField(
            title: 'End Time',
            isTime: true,
            controller: TasksCubit.get(context).timeEndController,
            onTap: () {
              _showDTimePicker(context, cubit, false);
            },
          ),
        )
      ],
    );
  }

  Row _dateTextFormFieldAndDateIcon(BuildContext context, TasksCubit cubit) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWithTextFormField(
                title: 'Date',
                controller: TasksCubit.get(context).dateController,
                onTap: () {
                  _showDatePicker(context, cubit);
                },
              ),
            ],
          ),
        ),
        HorizontalSpace(value: 4),
        Expanded(
          child: CircleAvatar(
            maxRadius: SizeConfig.defaultSize! * 2.7,
            backgroundColor: AppColors.mainColor,
            child: Center(
              child: IconButton(
                onPressed: () {
                  _showDatePicker(context, cubit);
                },
                icon: Icon(
                  Icons.date_range_rounded,
                ),
                color: Colors.white,
                iconSize: SizeConfig.defaultSize! * 3.7,
              ),
            ),
          ),
        )
      ],
    );
  }

  Row _selectCategoryTextAndSeeAllButton({required VoidCallback seeAllonTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Select Category',
          style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.w500),
        ),
        GestureDetector(
          onTap: seeAllonTap,
          child: Text(
            'See All',
            style: TextStyle(color: AppColors.mainColor, fontWeight: FontWeight.w300, fontSize: 12),
          ),
        )
      ],
    );
  }

  TitleWithTextFormField _inputTaskName(TasksCubit cubit) => TitleWithTextFormField(title: 'Task Name', controller: cubit.taskNameController);

  Row _createNewTaskTextAndNotesIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Create New Task',
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 2.3, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.note_alt_sharp,
          color: AppColors.mainColor,
          size: SizeConfig.defaultSize! * 5,
        )
      ],
    );
  }
}

_showDatePicker(BuildContext context, TasksCubit cubit) {
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 1000))).then((value) {
    cubit.selectDate(currentDate: value);
  });
}

_showDTimePicker(BuildContext context, TasksCubit cubit, bool isStartTime) {
  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  ).then((value) {
    cubit.selectTime(currenttime: value, isStartTime: isStartTime, context: context);
  });
}
