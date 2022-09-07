import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import '../../models/filter_model.dart';
import '../../utils/size_config.dart';

class FilterListItem extends StatelessWidget {
  const FilterListItem({
    Key? key,
    required this.filter,
  }) : super(key: key);

  final FilterModel filter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.01, horizontal: SizeConfig.screenWidth! * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.mainColor,
          ),
          color: filter.isSelected ? AppColors.mainColor : Colors.white,
        ),
        child: Text(
          filter.filterName,
          style: TextStyle(fontSize: SizeConfig.defaultSize! * 1.3, color: filter.isSelected ? Colors.white : AppColors.mainColor),
        ),
      ),
    );
  }
}
