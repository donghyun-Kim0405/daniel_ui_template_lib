library daniel_ui_template_lib;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/riverpod_cleanarchitecture.dart';

abstract class CustomTheme {
  CustomTheme._();

  static late DefaultColor _color;
  static DefaultColor get color => _color;

  static late DefaultTextStyle _textStyle;
  static DefaultTextStyle get textStyle => _textStyle;

  static late DefaultImagePath _imagePath;
  static DefaultImagePath get imagePath => _imagePath;

  static late DefaultSvgPath _svgPath;
  static DefaultSvgPath get svgPath => _svgPath;

  static initiate({
    required DefaultColor color,
    required DefaultTextStyle textStyle,
    required DefaultImagePath imagePath,
    required DefaultSvgPath svgPath,
  }) {
    _color = color;
    _textStyle = textStyle;
    _imagePath = imagePath;
    _svgPath = svgPath;

  }

}

class DefaultColor {

  final Color mainBackgroundColor;

  final Color primaryColor;
  final Color subColor;

  final Color btnEnableColor;
  final Color btnDisableColor;

  final Color btnEnableTextColor;
  final Color btnDisableTextColor;

  final Color dialogBackgroundColor;
  final Color dialogContentTextColor;

  final Color dialogLeftBtnColor;
  final Color dialogRightBtnColor;

  final Color dialogLeftBtnTextColor;
  final Color dialogRightBtnTextColor;

  final Color dialogOutlineColor;

  final Color popupBannerBackgroundColor;
  final Color popupBannerBtnTextColor;

  final Color textFieldBackgroundColor;
  final Color textFieldValueColor;
  final Color textFieldHintColor;
  final Color textFieldOutlineColor;

  final Color searchTextBackgroundColor;
  final Color searchTextOutlineColor;
  final Color searchTextValueColor;
  final Color searchTextHintColor;
  final Color searchTextSuffixImgColor;

  final Color dropdownBackgroundColor;
  final Color dropdownOutlineColor;
  final Color dropdownValueColor;

  final Color bottomSheetBackgroundColor;
  final Color bottomSheetControllerBarColor;
  final Color bottomSheetBtnTextColor;

  final Color timePickerBackgroundColor;
  final Color datePickerBackgroundColor;

  final Color dividerColor;

  DefaultColor({
    required this.mainBackgroundColor,
    required this.primaryColor,
    required this.subColor,
    required this.btnEnableColor,
    required this.btnDisableColor,
    required this.btnEnableTextColor,
    required this.btnDisableTextColor,
    required this.dialogBackgroundColor,
    required this.dialogContentTextColor,
    required this.dialogLeftBtnColor,
    required this.dialogRightBtnColor,
    required this.dialogLeftBtnTextColor,
    required this.dialogRightBtnTextColor,
    required this.dialogOutlineColor,
    required this.popupBannerBackgroundColor,
    required this.popupBannerBtnTextColor,
    required this.textFieldBackgroundColor,
    required this.textFieldValueColor,
    required this.textFieldHintColor,
    required this.textFieldOutlineColor,
    required this.searchTextBackgroundColor,
    required this.searchTextOutlineColor,
    required this.searchTextValueColor,
    required this.searchTextHintColor,
    required this.searchTextSuffixImgColor,
    required this.dropdownBackgroundColor,
    required this.dropdownValueColor,
    required this.dropdownOutlineColor,
    required this.bottomSheetBackgroundColor,
    required this.bottomSheetControllerBarColor,
    required this.bottomSheetBtnTextColor,
    required this.timePickerBackgroundColor,
    required this.datePickerBackgroundColor,
    required this.dividerColor,
  });

}

class DefaultTextStyle {

  final String fontFamily = RiverpodCleanArchitecture.ui.fontFamily;

  TextStyle blackw400 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  TextStyle blackw500 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  TextStyle blackw600 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  TextStyle blackw700 = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  TextStyle whitew400 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
  );

  TextStyle whitew500 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

  TextStyle whitew600 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );

  TextStyle whitew700 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );


  final TextStyle linkPreViewTitleTextStyle;
  final TextStyle linkPreViewBodyTextStyle;
  final TextStyle bottomSheetBtnTextStyle;

  final TextStyle datePickerTextStyle;
  final TextStyle timePickerTextStyle;

  final TextStyle datePickerBtnTextStyle;
  final TextStyle timePickerBtnTextStyle;

  DefaultTextStyle({
    required this.linkPreViewTitleTextStyle,
    required this.linkPreViewBodyTextStyle,
    required this.bottomSheetBtnTextStyle,
    required this.datePickerTextStyle,
    required this.timePickerTextStyle,
    required this.datePickerBtnTextStyle,
    required this.timePickerBtnTextStyle,
  });

}

class DefaultImagePath {
  final String IMG_BACK_BTN;
  final String IMG_CACHED_NETWORK_IMAGE_WARNING;
  final String IMG_TEXT_FIELD_CLOSE_BTN;

  DefaultImagePath({
    required this.IMG_BACK_BTN,
    required this.IMG_CACHED_NETWORK_IMAGE_WARNING,
    required this.IMG_TEXT_FIELD_CLOSE_BTN
  });
}

class DefaultSvgPath {

}
