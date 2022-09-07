import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/utils/size_config.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.paddingEdgeInsets,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets? paddingEdgeInsets;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth,
      padding: paddingEdgeInsets ?? EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 5, vertical: SizeConfig.defaultSize! * 2),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: SizeConfig.defaultSize!), primary: AppColors.mainColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: SizeConfig.defaultSize! * 2.5),
          )),
    );
  }
}
