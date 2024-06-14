

import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class BaseSearchTextField extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final double? textFieldHeight;
  final Function() searchBtnCallback;
  final String hintText;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final TextStyle? valueStyle;
  final bool isEnable;

  const BaseSearchTextField({
    super.key,
    this.textFieldHeight,
    this.hintStyle,
    this.valueStyle,
    required this.focusNode,
    required this.textEditingController,
    required this.searchBtnCallback,
    required this.hintText,
    required this.backgroundColor,
    this.isEnable = true
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
              color: backgroundColor ?? CustomTheme.color.searchTextBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              border: Border.all(width: 1, color: CustomTheme.color.searchTextOutlineColor)
          ),
          padding: EdgeInsets.only(left: 8.w),
          height: textFieldHeight ?? 42,
          child: Center(
            child: TextField(
              maxLines: 1,
              enabled: isEnable,
              onSubmitted: (value) => searchBtnCallback(),
              focusNode: focusNode,
              controller: textEditingController,
              textAlignVertical: TextAlignVertical.center,
              style: valueStyle ?? CustomTheme.textStyle.blackw400.copyWith(fontSize: 14, color: CustomTheme.color.searchTextValueColor),
              decoration: InputDecoration(
                isDense: true,
                focusColor: Colors.red,
                hintStyle: hintStyle ?? CustomTheme.textStyle.blackw400.copyWith(fontSize: 14, color: CustomTheme.color.searchTextHintColor),
                suffixIcon: GestureDetector(
                  onTap: () => searchBtnCallback(),
                  child: Icon(Icons.search, color: CustomTheme.color.searchTextSuffixImgColor),
                ),
                hintText: hintText,
                //border: InputBorder.none,
                border: InputBorder.none,
                //filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          )
      ),
    );
  }
}
