
import 'package:daniel_ui_template_lib/banners/popup/base_popup_banner_screen.dart';
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

import 'package:url_launcher/url_launcher.dart';

class TextPopupBannerScreen extends BasePopupBannerScreen {

  final Color titleColor;
  final Color contentColor;
  final Color seeDetailTextColor;
  final Color backgroundColor;
  final Function neverSeeAgain;
  final Function close;

  const TextPopupBannerScreen({
    super.key,
    required this.titleColor,
    required this.contentColor,
    required this.seeDetailTextColor,
    required this.backgroundColor,
    required super.model,
    required this.neverSeeAgain,
    required this.close
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 284.w,
      decoration: getBackgroundDecoration(),
      child: Column(
        children: [
          /// 제목 + 본문 + 자세히보기 버튼
          createTextArea(),

          /// 다시보지 않기 + 닫기 버튼
          createBtnsRow(),
        ],
      ),
    );
  }

  Widget createTextArea() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 23.w
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            color: backgroundColor
        ),
        width: double.infinity,
        height: 304.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 제목
            Text(
              (super.model.title ?? "제목없음"),
              style: CustomTheme.textStyle.whitew700.copyWith(fontSize: 20, color: titleColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 32.h),

            /// 본문
            Text(
              (super.model.content ?? ""),
              style: CustomTheme.textStyle.whitew400.copyWith(fontSize: 16, height: 22/16, color: contentColor),
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),

            Spacer(),

            /// 자세히보기 버튼
            GestureDetector(
              onTap: () async {
                if (await canLaunch(super.model.eventUrl ?? "")) {
                  await launch(super.model.eventUrl!);
                } else {
                  throw 'Could not launch ${super.model.eventUrl}';
                }
              },
              child: Text(
                '자세히 보기',
                style: CustomTheme.textStyle.whitew700.copyWith(fontSize: 16, decoration: TextDecoration.underline, color: seeDetailTextColor),
              ),
            )

          ],
        )
    );
  }

  Widget createBtnsRow() {
    return Container(
        height: 40.h,
        child: Row(
          children: [
            createBottomBtn(title: '다시보지 않기', callback: () => neverSeeAgain()),
            createVerticalDivider(),
            createBottomBtn(title: '닫기', callback: () => close()),
          ],
        )
    );
  }


}
