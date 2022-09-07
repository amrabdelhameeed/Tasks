import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class WidgetWithPadding extends StatelessWidget {
  const WidgetWithPadding({Key? key, this.horizontalSpace, this.verticalSpace, required this.widget}) : super(key: key);
  final double? verticalSpace;
  final double? horizontalSpace;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalSpace ?? SizeConfig.defaultSize! * 3, vertical: verticalSpace ?? SizeConfig.defaultSize! * 2),
      child: widget,
    );
  }
}
