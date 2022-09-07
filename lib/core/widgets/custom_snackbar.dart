library custom_snackbar;
import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar._();
  static void showSnackBar(
      {required BuildContext context,
      required String text,
      Widget button = const SizedBox.shrink(),
      Color backgroundColor = Colors.black87,
      Color textColor = Colors.white,
      DismissDirection dismissDirection = DismissDirection.horizontal,
      Duration duration = const Duration(seconds: 4),
      ShapeBorder shape = const RoundedRectangleBorder(),
      EdgeInsets margin = EdgeInsets.zero}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration,
      shape: shape,
      dismissDirection: dismissDirection,
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: margin,
      content: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
          button
        ],
      ),
    ));
  }
}