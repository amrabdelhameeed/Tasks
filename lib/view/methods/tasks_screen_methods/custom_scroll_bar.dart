import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/size_config.dart';

class CustomScrollbar extends StatelessWidget {
  const CustomScrollbar({Key? key, required this.scrollableWidget, required this.scrollController}) : super(key: key);
  final Widget scrollableWidget;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return AdaptiveScrollbar(
        sliderDefaultColor: AppColors.darkMainColor,
        sliderHeight: SizeConfig.defaultSize! * 10.5,
        width: SizeConfig.defaultSize! * 0.25,
        underSpacing: EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 3, vertical: SizeConfig.defaultSize! * 3),
        sliderSpacing: EdgeInsets.zero,
        position: ScrollbarPosition.left,
        controller: scrollController,
        child: scrollableWidget);
  }
}
