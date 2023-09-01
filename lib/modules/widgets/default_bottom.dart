import 'package:flutter/material.dart';
import 'package:simple_app/core/utils/helper.dart';

import '../../core/style/app_color.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String textBottom;
  const DefaultButton(
      {super.key, required this.onPressed, required this.textBottom});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(context.width, context.height * 0.07),
      ),
      onPressed: onPressed,
      child: Text(
        textBottom,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}
