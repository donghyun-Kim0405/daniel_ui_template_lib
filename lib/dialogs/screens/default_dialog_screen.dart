
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

import '../widgets/dialog_default_btn_widget.dart';


class DefaultDialogScreen extends StatelessWidget {

  final double? height;
  final Widget? centerImageWidget;

  final String contentText;

  final String leftBtnTitle;
  final String rightBtnTitle;

  final Color? dialogBackgroundColor;

  final Color? leftBtnColor;
  final Color? leftBtnTextColor;

  final Color? rightBtnColor;
  final Color? rightBtnTextColor;

  final Function leftBtnCallback;
  final Function rightBtnCallback;

  const DefaultDialogScreen(
      {super.key,
        this.height,
        this.centerImageWidget,
        required this.contentText,
        required this.leftBtnTitle,
        required this.rightBtnTitle,
        this.dialogBackgroundColor,
        this.leftBtnColor,
        this.rightBtnColor,
        this.leftBtnTextColor,
        this.rightBtnTextColor,
        required this.leftBtnCallback,
        required this.rightBtnCallback,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: height ?? 150.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: dialogBackgroundColor ?? CustomTheme.color.dialogBackgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          if(centerImageWidget != null)
            centerImageWidget!,

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            margin: EdgeInsets.only(top: 24.h),
            child: Text(
              contentText,
              style: CustomTheme.textStyle.whitew500.copyWith(fontSize: 18, height: 1.2),
              textAlign: TextAlign.center,
            ),
          ),


          /// 하단 Btn 영역
          Container(
            margin: EdgeInsets.only(bottom: 24.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 24.w),
                DialogDefaultBtnWidget(
                  title: leftBtnTitle,
                  btnColor: leftBtnColor ?? CustomTheme.color.dialogLeftBtnColor,
                  textColor: leftBtnTextColor ?? CustomTheme.color.dialogLeftBtnTextColor,
                  callback: () {
                    leftBtnCallback();
                    Navigator.of(context).pop();
                  },
                ),
                Spacer(),
                DialogDefaultBtnWidget(
                    title: rightBtnTitle,
                    callback: () {
                      Navigator.of(context).pop();
                      rightBtnCallback();
                    },
                    btnColor: rightBtnColor ?? CustomTheme.color.dialogRightBtnColor,
                    textColor: rightBtnTextColor ?? CustomTheme.color.dialogRightBtnTextColor
                ),
                SizedBox(width: 24.w),
              ],
            ),
          )
        ],
      ),
    );
  }
}
