import 'package:flutter/material.dart';
import '../../../view_model/tasks_cubit/tasks_cubit.dart';
import '../../../core/constants/app_images.dart';
import '../../../model/task.dart';
import '../../../core/packages/DatePickerTimelineFlutter-master/lib/extra/color.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 2),
      margin: EdgeInsets.only(left: SizeConfig.defaultSize! * 4, top: SizeConfig.defaultSize! * 2.3, right: SizeConfig.defaultSize! * 2, bottom: SizeConfig.defaultSize! * 0.5),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: SizeConfig.defaultSize! * 2, right: SizeConfig.defaultSize! * 0.9),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            width: SizeConfig.screenWidth,
            height: SizeConfig.defaultSize! * 16,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize!),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      height: SizeConfig.defaultSize! * 8,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(imagePath(task.categoryIndex)),
                        fit: BoxFit.fill,
                      )),
                    )),
                Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            child: Text(task.title, textAlign: TextAlign.end, style: TextStyle(height: 1.9, color: Colors.black, fontSize: SizeConfig.defaultSize! * 2, fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text(
                          task.description,
                          maxLines: 2,
                          style: TextStyle(
                            height: 1.2,
                            color: AppColors.mainColor,
                            fontSize: SizeConfig.defaultSize! * 1.3,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.end,
                        ))
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            width: SizeConfig.defaultSize! * 12.7,
            height: SizeConfig.defaultSize! * 5.3,
            child: Container(
              alignment: Alignment.center,
              decoration: AppStyles.topLeftBottomRightRadiusBoxDecoration,
              child: Text(
                task.startTime,
                style: AppStyles.whiteBoldTextStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

String imagePath(int categoryIndex) {
  final map = {0: AppImages.study, 1: AppImages.exercise, 2: AppImages.workspace, 3: AppImages.todo, 4: AppImages.others};
  return map[categoryIndex]!;
}
/*
ListTile(
              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              leading: Container(
                width: 100,
                height: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: AssetImage(imagePath(task.categoryIndex)), fit: BoxFit.fill)),
              ),
              subtitle: Text(
                task.description,
                maxLines: 2,
                style: TextStyle(
                  height: 1.2,
                  color: AppColors.mainColor,
                  fontSize: SizeConfig.defaultSize! * 1.3,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.end,
              ),
              title: Text(task.title, textAlign: TextAlign.end, style: TextStyle(height: 1.9, color: Colors.black, fontSize: SizeConfig.defaultSize! * 2, fontWeight: FontWeight.bold)),
            )
 */