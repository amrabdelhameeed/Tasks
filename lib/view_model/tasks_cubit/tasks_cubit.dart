import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  String currentFilter = FilterModel.filters.first.filterName;
  void selectFilter(FilterModel filterModel, List<FilterModel> filters) {
    for (var filter in filters) {
      filter.unSelectFilter();
    }
    filterModel.selectFilter();
    currentFilter = filterModel.filterName;
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
    this.currentDate = currentDate;
    emit(DateTimeLineChangedState());
  }

  void addtask(Task task) {
    Task.tasks.insert(0, task);
    taskNameController.clear();
    dateController.clear();
    timeStartController.clear();
    timeEndController.clear();
    taskDescriptionController.clear();
    emit(TaskAddedState());
  }
}
