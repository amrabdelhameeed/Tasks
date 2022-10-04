import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/constants/app_routes.dart';
import 'view/screens/add_task_screen/add_task_screen.dart';
import 'view/screens/tasks_screen/tasks_screen.dart';
import 'view_model/tasks_cubit/tasks_cubit.dart';

class AppRouter {
  late TasksCubit tasksCubit;
  AppRouter() {
    tasksCubit = TasksCubit();
  }
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.tasks:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<TasksCubit>.value(
              value: tasksCubit,
              child: TasksScreen(),
            );
          },
        );
      case AppRoutes.addTask:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider<TasksCubit>.value(
              value: tasksCubit,
              child: AddTaskScreen(),
            );
          },
        );
    }
    return _routeError();
  }

  MaterialPageRoute<dynamic> _routeError() {
    return MaterialPageRoute(
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: Text('Route Error'),
          ),
        );
      },
    );
  }
}
