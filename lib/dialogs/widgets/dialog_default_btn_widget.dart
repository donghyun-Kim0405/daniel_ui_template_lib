

import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/riverpod_cleanarchitecture.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class DialogDefaultBtnWidget extends StatelessWidget {

  final String title;
  final Function callback;
  final Color btnColor;
  final Color textColor;

  const DialogDefaultBtnWidget({super.key, required this.title, required this.callback, required this.btnColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        width: 128.w,
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: btnColor
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: RiverpodCleanArchitecture.ui.fontFamily,
                fontSize: 16,
                color: textColor
              )
          ),
        ),
      ),
    );
  }


}
