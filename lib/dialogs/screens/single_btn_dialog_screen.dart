import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class SingleBtnDialogScreen extends StatelessWidget {
  final String contentText;

  final String btnText;
  final Function? btnCallback;

  const SingleBtnDialogScreen(
      {super.key,
      required this.contentText,
      this.btnText = "확인",
      this.btnCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: CustomTheme.color.dialogBackgroundColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            contentText,
            style: CustomTheme.textStyle.whitew500.copyWith(fontSize: 18, color: CustomTheme.color.dialogContentTextColor),
          ),
          GestureDetector(
            onTap: () {
              if (btnCallback == null) {
                Navigator.of(context).pop();
              } else {
                btnCallback!();
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 16.h),
              width: double.infinity,
              height: 44.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: CustomTheme.color.btnEnableColor),
              child: Center(
                child: Text(
                  btnText,
                  style: CustomTheme.textStyle.blackw600.copyWith(fontSize: 16, color: CustomTheme.color.btnEnableTextColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
