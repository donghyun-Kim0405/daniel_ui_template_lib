
import 'package:daniel_ui_template_lib/banners/popup/base_popup_banner_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';


class EventPopupBannerScreen extends BasePopupBannerScreen {

  final Function launchEventBtnClicked;

  const EventPopupBannerScreen({super.key, required super.model, required this.launchEventBtnClicked});

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
              height: 40.h,
              width: SizeUtil.deviceSize.width,
              child: Row(
                children: [
                  createBottomBtn(title: '이벤트 바로가기', callback: () => launchEventBtnClicked()),
                ],
              )
          )
        ],
      ),
    );
  }

}
