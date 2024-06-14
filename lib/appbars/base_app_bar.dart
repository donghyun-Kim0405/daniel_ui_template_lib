

import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class BaseAppBar extends StatelessWidget {
  final String? content;
  final Color? backgroundColor;
  final String? rightImgBtnPath;
  final Widget? rightImageWidget;
  final Function? leftImgBtnCallback;
  final Function? rightImgBtnCallback;
  final bool hideLeftBtn;
  const BaseAppBar({Key? key, this.rightImageWidget, this.hideLeftBtn = false, this.content, this.backgroundColor,this.leftImgBtnCallback, this.rightImgBtnPath, this.rightImgBtnCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor != null ? backgroundColor : Colors.transparent,
      width: SizeUtil.deviceSize.width,
      height: SizeUtil.height(52),
      child: Stack(
        children: [
          /// 1. 왼쪽 back btn
          if(!hideLeftBtn) Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: () {
                leftImgBtnCallback == null
                    ? Navigator.pop(context)
                    : leftImgBtnCallback!();
              },
              child: Container(
                margin: EdgeInsets.only(left: 12.w),
                child: Image.asset(CustomTheme.imagePath.IMG_BACK_BTN, width: 32.w,)
              ),
            ),
          ),

          /// 2. 가운데 title
          content != null
              ? Align(
            alignment: Alignment.center,
            child: Text(
                content!,
                style: CustomTheme.textStyle.whitew700.copyWith(fontSize: 16)
            ),
          )
              : Container(),


          /// 3. 우측 img btn
          ( (rightImageWidget != null || rightImgBtnPath != null) && rightImgBtnCallback != null)
              ? Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () => rightImgBtnCallback!(),
                      child: rightImageWidget ?? Container(
                        margin: EdgeInsets.only(right: 16.w),
                        child: Image.asset(rightImgBtnPath!, width: 40.w, color: CupertinoColors.white,)
                      )
                  ),
                )
              : Container()


        ],
      ),
    );
  }
}
