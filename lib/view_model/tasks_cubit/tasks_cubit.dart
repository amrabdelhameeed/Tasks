import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../core/notification_helper.dart';
import '../../model/notes_provider.dart';
import '../../core/models/filter_model.dart';
import '../../model/task.dart';
import 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitaialState());
  static TasksCubit get(context) => BlocProvider.of(context);

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeStartController = TextEditingController();
  final TextEditingController timeEndController = TextEditingController();
  DateTime currentDate = DateTime.now();
  int currentFilter = FilterModel.filters.first.index;
  void selectFilter(FilterModel filterModel, List<FilterModel> filters) {
    for (var filter in filters) {
      filter.unSelectFilter();
    }
    filterModel.selectFilter();
    currentFilter = filterModel.index;
    emit(TasksFilterSelectedState());
  }

  var dateFormat = DateFormat('EEEE, d MMMM');
  void selectDate({required DateTime? currentDate}) {
    if (currentDate != null) {
      dateController.text = dateFormat.format(currentDate);
    }
  }

  void selectTime({required TimeOfDay? currenttime, required bool isStartTime, required BuildContext context}) {
    if (currenttime != null) {
      if (isStartTime) {
        timeStartController.text = currenttime.format(context);
      } else {
        timeEndController.text = currenttime.format(context);
      }
    }
  }

  void changeDate({required DateTime currentDate}) {
    if (currentDate != this.currentDate) {
      this.currentDate = currentDate;
      emit(DateTimeLineChangedState());
    }
  }

  void _convertDate(Task task) {
    TimeOfDay _convertTimeto24HoursMode(String timeOfDay) {
      final time = DateFormat('hh:mm a').parse(timeOfDay);
      return TimeOfDay(hour: int.parse(time.toString().substring(11, 13)), minute: int.parse(time.toString().substring(14, 16)));
    }

    var date = dateFormat.parse(task.date);
    final now = DateTime.now();
    final time = _convertTimeto24HoursMode(task.startTime);
    date = DateTime(
      now.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    task.date = date.toString();
  }

  void deleteTask(Task task) {
    TasksProvider.deleteTask(task);
    NotificationHelper.deleteNotification(id: int.parse(DateTime.parse(task.date).millisecondsSinceEpoch.toString().substring(4)));
    emit(TaskDeletedState());
  }

  void addtask(Task task) {
    _convertDate(task);
    TasksProvider.addTask(task);
    taskNameController.clear();
    dateController.clear();
    timeStartController.clear();
    timeEndController.clear();
    taskDescriptionController.clear();
    currentFilter = 0;
    NotificationHelper.sheduleNotification(title: 'title', body: ' body', dateTime: DateTime.parse(task.date));
    emit(TaskAddedState());
  }
}
