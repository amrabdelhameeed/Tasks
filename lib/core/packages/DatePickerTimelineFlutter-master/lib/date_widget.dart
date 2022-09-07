import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'gestures/tap.dart';
import '../../../utils/size_config.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;
  // final bool isSelected;
  DateWidget({
    required this.date,
    // required this.isSelected,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  final Color _mainColor = const Color(0xFF469BDA);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: EdgeInsets.all(SizeConfig.defaultSize! * 0.3),
        decoration: BoxDecoration(
          border: Border.all(color: _mainColor),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: selectionColor,
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.defaultSize! * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
              //     style: monthTextStyle),
              Text(date.day.toString(), // Date
                  style: dateTextStyle),
              Text(DateFormat("E", locale).format(date).toUpperCase()[0],
                  // WeekDay
                  style: dayTextStyle!.copyWith(fontSize: SizeConfig.defaultSize! * 1.3))
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(date);
        }
      },
    );
  }
}
