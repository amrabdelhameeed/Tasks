import 'package:flutter/cupertino.dart';
import 'package:todo_task/core/constants/custom_clipper.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/drawer_and_notification_icon.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/my_task_text_and_add_task_button.dart';
import 'package:todo_task/view/methods/tasks_screen_methods/user_avatar.dart';

SizedBox backgroundCustomPainterAndItsWidgets(BuildContext context) {
  return SizedBox(
    width: SizeConfig.screenWidth,
    height: SizeConfig.screenHeight,
    child: CustomPaint(
      painter: RPSCustomPainter(),
      child: Stack(
        children: [drawerAndNotificationIcon(), userAvatar(), dateTimeLinePickerAndAddButtonWithTexts(context)],
      ),
    ),
  );
}
