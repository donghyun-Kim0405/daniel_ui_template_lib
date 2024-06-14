import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';
import '../daniel_ui_template_lib.dart';

class CancelRegisterAppBar extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final bool? registerBtnAvailalbe;
  final Function registerCallback;
  final Function cancelCallback;


  const CancelRegisterAppBar(
      { super.key,
        required this.title,
        required this.backgroundColor,
        required this.registerBtnAvailalbe,
        required this.registerCallback,
        required this.cancelCallback
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: backgroundColor != null ? backgroundColor :  Colors.transparent,
        border: Border(
          bottom: BorderSide(width: 0.5, color: CustomTheme.color.dividerColor)
        )
      ),
      width: SizeUtil.deviceSize.width,
      height: 52.h,
      child: Stack(
        children: [
          /// 1. Cancel Text Btn
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => cancelCallback(),
              child: Container(
                child: Text(
                  '취소',
                  style: CustomTheme.textStyle.whitew400.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),

          /// 2. Title
          Visibility(
            visible: title != null,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                title ?? "",
                style: CustomTheme.textStyle.whitew400.copyWith(fontSize: 18),
              ),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => registerCallback(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 19, vertical: 5.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(17.5)),
                  color: registerBtnAvailalbe ?? false
                    ? CustomTheme.color.btnEnableColor
                      : CustomTheme.color.btnDisableColor
                ),
                child: Text(
                  '등록',
                  style: registerBtnAvailalbe ?? false
                  ? CustomTheme.textStyle.whitew700.copyWith(fontSize: 14, color: CustomTheme.color.btnEnableTextColor)
                  : CustomTheme.textStyle.blackw700.copyWith(fontSize: 14, color: CustomTheme.color.btnDisableTextColor)
                ),
              ),
            ),
          )


        ],
      ),
    );
  }



}
