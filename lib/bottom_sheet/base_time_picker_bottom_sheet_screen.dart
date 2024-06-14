

import 'package:flutter/cupertino.dart';
import '../daniel_ui_template_lib.dart';

class BaseTimePickerBottomSheetScreen extends StatelessWidget {

  final Function({required DateTime dateTime}) timeSelectedCallback;

  const BaseTimePickerBottomSheetScreen({Key? key, required this.timeSelectedCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: CustomTheme.color.timePickerBackgroundColor,
        child: Column(
          children: [
            Container(
              height: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        pickerTextStyle: CustomTheme.textStyle.timePickerTextStyle
                    )
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  use24hFormat: true,
                  initialDateTime: DateTime(
                    0,
                    0,
                    0,
                    0,
                    0,
                  ),
                  onDateTimeChanged: (DateTime newDateTime) {
                    timeSelectedCallback(dateTime: newDateTime);
                  },
                ),
              ),
            ),
            CupertinoButton(
              child: Text(
                '확인',
                style: CustomTheme.textStyle.timePickerBtnTextStyle,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
