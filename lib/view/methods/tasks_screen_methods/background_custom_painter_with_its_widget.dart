import 'package:flutter/cupertino.dart';
import '../../../core/constants/custom_clipper.dart';
import '../../../core/utils/size_config.dart';
import 'drawer_and_notification_icon.dart';
import 'my_task_text_and_add_task_button.dart';
import 'user_avatar.dart';

class BackgroundCustomPainterAndItsWidgets extends StatelessWidget {
  const BackgroundCustomPainterAndItsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: CustomPaint(
        painter: RPSCustomPainter(),
        child: Stack(
          children: const [DrawerAndNotificationIcon(), UserAvatar(), DateTimeLinePickerAndAddButtonWithTexts()],
        ),
      ),
    );
  }
}
