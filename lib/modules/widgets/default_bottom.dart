import 'package:flutter/material.dart';

import '../../../../../../core/utils/screen_config.dart';
import '../../core/style/app_color.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final String textBottom;
  const DefaultButton(
      {super.key, required this.onPressed, required this.textBottom});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize:
            Size(SizeConfig.screenWidth, SizeConfig.screenHeight * 0.07),
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
