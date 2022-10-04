import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'core/constants/app_strings.dart';
import 'core/notification_helper.dart';
import 'model/task.dart';

import '/core/constants/app_routes.dart';
import 'app_router.dart';
import 'core/constants/observer.dart';
import 'package:path_provider/path_provider.dart' as path;

String intialRoute = AppRoutes.tasks;
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationHelper.init();
  final dirc = await path.getApplicationDocumentsDirectory();
  Hive.init(dirc.path);
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>(AppStrings.tasksKey).then((value) {
    print('opened');
  });
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      initialRoute: intialRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
