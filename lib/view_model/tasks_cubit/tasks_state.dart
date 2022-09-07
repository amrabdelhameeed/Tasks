import 'package:flutter/material.dart';

@immutable
abstract class TasksState {}

class TasksInitaialState extends TasksState {}

class TasksChangedState extends TasksState {}

class TaskAddedState extends TasksState {}

class TasksFilterSelectedState extends TasksState {}

class DateTimeLineChangedState extends TasksState {}
