import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';
import '../daniel_ui_template_lib.dart';

class SingleOutlineTextField extends StatelessWidget {
  
  final String hint;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final double width;
  final double height;
  final Color? outlineColor;
  final Color? backgroundColor;

  final TextStyle? hintTextStyle;
  final TextStyle? valueTextStyle;

  final bool isNumber;
  final bool usingCloseBtn;

  final bool isEnabled;
  final bool hideCloseBtn;
  
  const SingleOutlineTextField({
    Key? key,
    required this.hint,
    required this.controller,
    this.focusNode,
    required this.width,
    required this.height,
    this.outlineColor,
    this.backgroundColor,
    this.hintTextStyle,
    this.valueTextStyle,
    this.isEnabled = true,
    this.isNumber = false,
    this.usingCloseBtn = false,
    this.hideCloseBtn = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        border: Border.all(width: 1, color: outlineColor != null ? outlineColor! : CustomTheme.color.textFieldOutlineColor),
        color: backgroundColor != null ? backgroundColor! : CustomTheme.color.textFieldBackgroundColor
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              enabled: isEnabled,
              controller: controller,
              keyboardType: isNumber ? TextInputType.number : null,
              maxLines: 1,
             focusNode: focusNode,
              style: valueTextStyle != null
              ? valueTextStyle
              : TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: CustomTheme.textStyle.fontFamily,
                  fontSize: 18,
                  color: CustomTheme.color.textFieldValueColor
                ),
              decoration: InputDecoration(
                hintStyle: hintTextStyle != null
                    ? hintTextStyle
                    : TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: CustomTheme.textStyle.fontFamily,
                        fontSize: 18,
                        color: CustomTheme.color.textFieldHintColor
                      ),
                hintText: hint,
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none
              ),
            ),
          ),
          Visibility(
            visible: !hideCloseBtn,
            child: GestureDetector(
              onTap: () {
                controller.clear();
              },
                child: Image.asset(CustomTheme.imagePath.IMG_TEXT_FIELD_CLOSE_BTN, width: 16.w,)
            ),
          ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }
}
