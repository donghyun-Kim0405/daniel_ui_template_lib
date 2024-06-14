import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';


class BaseMultiLineTextField extends StatelessWidget {

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final String hintText;
  final double minHeight;
  final TextStyle? hintStyle;
  final TextStyle? contentStyle;

  BaseMultiLineTextField({
    Key? key,
    required this.focusNode,
    required this.textEditingController,
    required this.hintText,
    required this.minHeight,
    this.hintStyle,
    this.contentStyle
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        //constraints: BoxConstraints(minHeight: 219.h), // 최소 높이 값 설정
        width: double.infinity,
        height: minHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(width: 1, color: CustomTheme.color.textFieldOutlineColor),
          color: CustomTheme.color.textFieldBackgroundColor,
        ),
        child: TextField(
          focusNode: focusNode,
          controller: textEditingController,
          maxLines: null,
          expands: true,
          style: contentStyle ?? CustomTheme.textStyle.whitew400.copyWith(fontSize: 14, color: CustomTheme.color.textFieldValueColor),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ?? CustomTheme.textStyle.whitew400.copyWith(fontSize: 14, color: CustomTheme.color.textFieldHintColor),
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}
