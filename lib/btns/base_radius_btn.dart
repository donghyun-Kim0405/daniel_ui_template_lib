

import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';


class BaseRadiusBtn extends StatelessWidget {

  final String title;
  final bool btnAvailable;
  final Color activatedColor;
  final Color? deActivatedColor;
  final double radius;
  final double height;
  final double width;
  final FontWeight fontWeight;
  final double fontSize;
  final Color activateTextColor;
  final Color? deActivateTextColor;
  final Function callback;

  const BaseRadiusBtn({
    Key? key,
    required this.title,
    this.btnAvailable = true,
    required this.activatedColor,
    this.deActivatedColor,
    required this.radius,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.fontWeight,
    required this.activateTextColor,
    this.deActivateTextColor,
    required this.callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(btnAvailable) callback();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: btnAvailable ? activatedColor : deActivatedColor
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: fontWeight,
              fontFamily: CustomTheme.textStyle.fontFamily,
              fontSize: fontSize,
              color: btnAvailable ? activateTextColor : deActivateTextColor
            ),
          )
          ,
        ),
      ),
    );
  }
}
