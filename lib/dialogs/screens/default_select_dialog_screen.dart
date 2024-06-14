
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

import '../../daniel_ui_template_lib.dart';
import '../widgets/dialog_default_btn_widget.dart';

class DefaultSelectDialogScreen extends StatefulWidget {

  final String titleText;
  final List<String> itemList;

  final String leftBtnTitle;
  final String rightBtnTitle;

  final Color? dialogBackgroundColor;

  final Color? leftBtnColor;
  final Color? leftBtnTextColor;

  final Color? rightBtnColor;
  final Color? rightBtnTextColor;

  final Function leftBtnCallback;
  final Function rightBtnCallback;

  final Color? checkBoxCheckedColor;
  final Color? checkBoxUnCheckedColor;

  const DefaultSelectDialogScreen(
      {super.key,
        required this.titleText,
        required this.itemList,
        required this.leftBtnTitle,
        required this.rightBtnTitle,
        this.dialogBackgroundColor,
        this.leftBtnColor,
        this.rightBtnColor,
        this.leftBtnTextColor,
        this.rightBtnTextColor,
        required this.leftBtnCallback,
        required this.rightBtnCallback,
        this.checkBoxCheckedColor,
        this.checkBoxUnCheckedColor
      });

  @override
  State<DefaultSelectDialogScreen> createState() => _DefaultSelectDialogScreenState();
}

class _DefaultSelectDialogScreenState extends State<DefaultSelectDialogScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: widget.dialogBackgroundColor ?? CustomTheme.color.dialogBackgroundColor
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Text(
                widget.titleText,
                style: CustomTheme.textStyle.whitew700.copyWith(fontSize: 18),
              ),
              SizedBox(height: 31.h),
              for(int i = 0; i < widget.itemList.length; i++)
                createCheckBoxRow(index: i),
              
              SizedBox(height: 16.h),

              /// 하단 Btn 영역
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    DialogDefaultBtnWidget(
                      title: widget.leftBtnTitle,
                      btnColor: widget.leftBtnColor ?? CustomTheme.color.dialogLeftBtnColor,
                      textColor: widget.leftBtnTextColor ?? CustomTheme.color.dialogLeftBtnTextColor,
                      callback: () {
                        Navigator.of(context).pop();
                        widget.leftBtnCallback();
                      },
                    ),
                    Spacer(),
                    DialogDefaultBtnWidget(
                        title: widget.rightBtnTitle,
                        callback: () {
                          Navigator.of(context).pop();
                          widget.rightBtnCallback(widget.itemList[selectedIndex]);
                        },
                        btnColor: widget.rightBtnColor ?? CustomTheme.color.dialogRightBtnColor,
                        textColor: widget.rightBtnTextColor ?? CustomTheme.color.dialogRightBtnTextColor
                    ),
                  ],
                ),
              )

            ],
          ),
        )
    );
  }

  /// 각 체크박스 row
  Widget createCheckBoxRow({required int index}) {
  	return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
  	  child: Container(
      height: 52.h,
      width: double.infinity,
      color: Colors.transparent,
  	  	child: Row(
        children: [
          index == selectedIndex
              ? Icon(Icons.radio_button_checked_rounded, color: widget.checkBoxCheckedColor ?? CustomTheme.color.primaryColor,)
              : Icon(Icons.radio_button_unchecked_rounded, color: widget.checkBoxUnCheckedColor ?? Colors.grey,),
          SizedBox(width: 8.w),
          Text(
            widget.itemList[index],
            style: CustomTheme.textStyle.whitew700.copyWith(fontSize: 16),
          )
        ],
      )
  	  ),
  	);
  }

}
