

import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:daniel_ui_template_lib/models/banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

abstract class BasePopupBannerScreen extends StatelessWidget {
  final BannerModel model;
  const BasePopupBannerScreen({super.key, required this.model});

  Widget createImageArea() {
    return AspectRatio(
      aspectRatio: 1.0, // 1:1 비율을 가지도록 설정하여 정사각형 모양을 유지합니다
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          color: CupertinoColors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12)
          ),
          image: model.imageUrl != null
              ? DecorationImage(
            image: NetworkImage(model.imageUrl!),
            fit: BoxFit.cover, // 이미지를 적절하게 맞춰줍니다
          )
              : null, // 이미지가 없는 경우에는 null로 설정하여 기본 배경을 사용합니다
        ),
      ),
    );
  }

  Widget createBottomBtn({required String title, required Function callback}) {
    return Expanded(
      child: GestureDetector(
        onTap: () => callback(),
        child: Container(
            color: Colors.transparent,
            child: Center(
              child: Text(
                title,
                style: CustomTheme.textStyle.whitew500.copyWith(fontSize: 12, color: CustomTheme.color.popupBannerBtnTextColor),
              ),
            )
        ),
      ),
    );
  }

  BoxDecoration getBackgroundDecoration() => BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    color: CustomTheme.color.popupBannerBackgroundColor,
  );

  Widget createVerticalDivider() => Container(
    width: 0.5, height: double.infinity, color: CustomTheme.color.dividerColor,
  );


}
