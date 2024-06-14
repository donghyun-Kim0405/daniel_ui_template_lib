
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';


class ForceUpdateDialogScreen extends StatelessWidget {
  final Function confirmBtnCallback;
  const ForceUpdateDialogScreen({Key? key, required this.confirmBtnCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 188.h,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: CustomTheme.color.dialogOutlineColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          createTitle(),
          createContent(),
          createConfirmBtn()
        ],
      ),
    );
  }

  Widget createTitle() {
  	return Text(
        '최신 버전 업데이트',
        style: CustomTheme.textStyle.whitew600.copyWith(fontSize: 18),
      );
  }

  Widget createContent() {
  	return Text(
        '최신 버전 앱으로 업데이트를 위해\n스토어로 이동합니다.',
        style: CustomTheme.textStyle.whitew400.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      );
  }

  Widget createConfirmBtn() {
  	return GestureDetector(
      onTap: () => confirmBtnCallback(),
      child: Container(
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: CustomTheme.color.primaryColor),
        child: Center(
          child: Text(
            '확인',
            style: CustomTheme.textStyle.blackw600
                .copyWith(fontSize: 16, color: CupertinoColors.white),
          ),
        ),
      ),
    );
  }
}
