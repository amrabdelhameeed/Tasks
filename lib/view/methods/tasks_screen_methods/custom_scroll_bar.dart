import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_colors.dart';
import 'package:todo_task/core/utils/size_config.dart';

AdaptiveScrollbar customScrollbar({required Widget scrollableWidget, required ScrollController scrollController}) {
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
