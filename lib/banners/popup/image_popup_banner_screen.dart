
import 'package:daniel_ui_template_lib/banners/popup/base_popup_banner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class ImagePopupBannerScreen extends BasePopupBannerScreen {
  final Function neverSeeAgain;
  final Function close;
  final Color btnsRowColor;

  const ImagePopupBannerScreen({super.key, required super.model, required this.neverSeeAgain, required this.close, required this.btnsRowColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: getBackgroundDecoration(),
      width: 284.w,
      child: Column(
        children: [
          Container(
              width: 343.w,
              child: createImageArea()
          ),
          Container(
            color: btnsRowColor,
            height: 40.h,
            child: Row(
              children: [
                createBottomBtn(title: '다시보지 않기', callback: () => neverSeeAgain()),
                createVerticalDivider(),
                createBottomBtn(title: '닫기', callback: () => close()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
