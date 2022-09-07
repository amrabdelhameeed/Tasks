  import 'package:flutter/material.dart';
import 'package:todo_task/core/constants/app_images.dart';
import 'package:todo_task/core/utils/size_config.dart';

Positioned userAvatar() {
    return Positioned(
        right: SizeConfig.defaultSize! * 3,
        top: SizeConfig.defaultSize! * 2.1,
        child: CircleAvatar(
          maxRadius: SizeConfig.defaultSize! * 2.7,
          backgroundImage: const AssetImage(AppImages.cooking),
        ));
  }