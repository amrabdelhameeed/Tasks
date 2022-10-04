import 'package:flutter/material.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_config.dart';

class TitleWithTextFormField extends StatelessWidget {
  const TitleWithTextFormField({Key? key, required this.title, required this.controller, this.onTap, this.isTime = false}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.w500TextStyle,
        ),
        SizedBox(
          height: SizeConfig.defaultSize! * 5.5,
          child: GestureDetector(
            onTap: onTap ?? () {},
            child: TextFormField(
              style: AppStyles.w600TextStyleBlack,
              enabled: onTap == null, //onTap ==null => that means there is no picker (date or time) and it is a normal text form field and can be edited
              controller: controller,
              // isTime ==true => there is suffix Icon otherwise there is not
              decoration: isTime ? AppStyles.inputDecorationUnderlinedMainColoredWithSuffixIcon : AppStyles.inputDecorationUnderlinedMainColored,
            ),
          ),
        ),
      ],
    );
  }
}
