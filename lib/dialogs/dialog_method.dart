
import 'package:daniel_ui_template_lib/dialogs/screens/full_image_dialog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showCustomDialog({
  BuildContext context,
  required Widget widget,
  bool canDismissible = true
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(type: MaterialType.transparency, child: widget),
          ],
        ),
      );
    },
    barrierDismissible: canDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: Duration(milliseconds: 200),
  );
}

showCustomFullScreenDialog({
  required BuildContext context,
  required Widget widget,
}) {
  showGeneralDialog(
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Scaffold(
        backgroundColor: Colors.transparent, // 배경을 투명하게 설정
        body: Center(
          child: Material(
            type: MaterialType.transparency,
            child: widget, // 여기서 widget은 다이얼로그 내부에 표시할 내용
          ),
        ),
      );
    },
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45, // 다이얼로그 외부를 어둡게 표시
    transitionDuration: Duration(milliseconds: 200), // 애니메이션 지속 시간 설정
  );
}

showImageFullScreenDialog({required BuildContext context, required String imageUrl}) {
  showCustomFullScreenDialog(
      context: context,
      widget: FullImageDialogScreen(imageUrl: imageUrl)
  );
}