import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';


class BaseDatePickerBottomSheetScreen extends StatelessWidget {
  final Function({required DateTime dateTime}) dateSelectedCallback;

  BaseDatePickerBottomSheetScreen({Key? key, required this.dateSelectedCallback}) : super(key: key);

  DateTime newDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final DateTime currentDateTime = DateTime.now();

    return IntrinsicHeight(
      child: Container(
        color: CustomTheme.color.datePickerBackgroundColor,
        child: Column(
          children: [
            Container(
              height: 200,
              child: CupertinoTheme(
                data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                        pickerTextStyle: CustomTheme.textStyle.datePickerTextStyle
                    )
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(
                    currentDateTime.year,
                    currentDateTime.month,
                    currentDateTime.day,
                    0,
                    0,
                  ),
                  onDateTimeChanged: (DateTime dateTime) {
                    newDateTime = dateTime;
                  },
                ),
              ),
            ),
            CupertinoButton(
              child: Text(
                '확인',
                style: CustomTheme.textStyle.datePickerBtnTextStyle,
              ),
              onPressed: () {
                dateSelectedCallback(dateTime: newDateTime);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
