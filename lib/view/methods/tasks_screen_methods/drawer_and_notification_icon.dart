import 'package:flutter/material.dart';
import '../../../core/notification_helper.dart';
import '../../../core/packages/DatePickerTimelineFlutter-master/lib/extra/color.dart';
import '../../../core/utils/size_config.dart';

class DrawerAndNotificationIcon extends StatelessWidget {
  const DrawerAndNotificationIcon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: SizeConfig.defaultSize! * 2,
        left: SizeConfig.defaultSize! * 2,
        child: Row(
          children: [
            //drawer icon
            IconButton(
              onPressed: () {
                print('icon pressed');
                NotificationHelper.sheduleNotification(
                  title: 'title',
                  body: ' body',
                  dateTime: DateTime.now(),
                );
              },
              icon: const Icon(Icons.sort_rounded),
              iconSize: SizeConfig.defaultSize! * 3.5,
            ),
            //notification icon with the red circle
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none_rounded, color: AppColors.mainColor),
                  iconSize: SizeConfig.defaultSize! * 3.5,
                ),
                Positioned(
                  bottom: SizeConfig.defaultSize! * 1.4,
                  left: SizeConfig.defaultSize! * 1.7,
                  child: const Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 13,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
