import 'package:flutter/material.dart';
import 'package:todo_task/core/utils/size_config.dart';
import 'package:todo_task/core/widgets/widget_with_padding.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        WidgetWithPadding(
            verticalSpace: 0,
            widget: Icon(
              Icons.notes,
              size: SizeConfig.defaultSize! * 4,
              color: Colors.black,
            ))
      ],
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? SizeConfig.defaultSize! * 7);
}
