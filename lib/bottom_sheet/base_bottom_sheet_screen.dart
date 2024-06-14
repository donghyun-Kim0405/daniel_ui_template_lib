

import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';


class BaseBottomSheetScreen extends StatelessWidget {

  final String firstTitle;
  final Widget? firstImgWidget;
  final Function firstCallback;

  final String? secondTitle;
  final Widget? secondImgWidget;
  final Function? secondCallback;

  final String? thirdTitle;
  final Widget? thirdImgWidget;
  final Function? thirdCallback;

  final Color? backgroundColor;

  const BaseBottomSheetScreen({
    super.key,
    required this.firstTitle,
    this.firstImgWidget,
    required this.firstCallback,
    this.secondTitle,
    this.secondImgWidget,
    this.secondCallback,
    this.thirdTitle,
    this.thirdImgWidget,
    this.thirdCallback,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: backgroundColor ?? CustomTheme.color.bottomSheetBackgroundColor
        ),
        padding: EdgeInsets.only(top: 10.h, bottom: 48.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createGestureBar(),

              SizedBox(height: 26.h),

              createBtnRow(context: context, title: firstTitle, imgWidget: firstImgWidget, callback: firstCallback),

              if(secondTitle != null && secondCallback != null) createBtnRow(context: context, title: secondTitle!, imgWidget: secondImgWidget, callback: secondCallback!),

              if(thirdTitle != null && thirdCallback != null) createBtnRow(context: context, title: thirdTitle!, imgWidget: thirdImgWidget, callback: thirdCallback!),


            ],
          ),
        ),
      ),
    );
  }

  Widget createGestureBar() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        width: 48.w,
        height: 5.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomTheme.color.bottomSheetControllerBarColor
        ),
      ),
    ],
  );

  Widget createBtnRow({
    required BuildContext context,
    required String title,
    required Widget? imgWidget,
    required Function callback
  }) {
    return GestureDetector(
      onTap: () async {
        await callback();
      },
      child: Container(
          color: Colors.transparent,
          height: 58.h,
          margin: EdgeInsets.only(left: 24.w, right: 16.w),
          child: Row(
            mainAxisAlignment: imgWidget == null ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Text(
                title,
                style: CustomTheme.textStyle.bottomSheetBtnTextStyle,
              ),

              if(imgWidget != null) Container(
                width: 32,
                height: 32,
                child: imgWidget,
              )
            ],
          )
      ),
    );
  }



}
