import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/constants/app_routes.dart';
import 'app_router.dart';
import 'core/constants/observer.dart';
import 'core/utils/shared_pref_helper.dart';

String intialRoute = AppRoutes.tasks;
void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.init();
  // AppStrings.token = SharedPrefHelper.getData(key: AppStrings.tokenKey);
  // if (AppStrings.token!.isNotEmpty) {
  //   intialRoute = AppRoutes.home;
  // }
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
      title: 'My App',
      initialRoute: intialRoute,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
