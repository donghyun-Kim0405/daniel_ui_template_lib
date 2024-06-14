
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';


class BaseDropDownItemModel {
  final dynamic type;
  final String title;
  BaseDropDownItemModel({required this.type, required this.title});
}

class BaseDropDownBtn extends StatefulWidget {

  final List<BaseDropDownItemModel> dropdownItemList;
  final Function({required BaseDropDownItemModel selectedItem}) itemSelectedCallback;
  final bool isExpand;
  final BoxDecoration? boxDecoration;
  final TextStyle? textStyle;
  final double? paddingHorizontal;

  const BaseDropDownBtn({Key? key, required this.dropdownItemList, required this.itemSelectedCallback, this.paddingHorizontal, this.textStyle, this.boxDecoration, this.isExpand = true}) : super(key: key);

  @override
  State<BaseDropDownBtn> createState() => _BaseDropDownBtnState();
}

class _BaseDropDownBtnState extends State<BaseDropDownBtn> {

  late BaseDropDownItemModel selectedItemModel;

  @override
  void initState() {
    // 첫 번째 아이템을 초기 선택값으로 설정합니다.
    selectedItemModel = widget.dropdownItemList[0];

    // 모든 아이템이 고유한지 검사하는 로직을 추가할 수 있습니다.
    assert(widget.dropdownItemList.toSet().length == widget.dropdownItemList.length, "모든 드롭다운 아이템은 고유해야 합니다.");

    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      widget.itemSelectedCallback(selectedItem: selectedItemModel);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.dropdownItemList.contains(selectedItemModel)) selectedItemModel = widget.dropdownItemList[0];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal ?? 16.w),
      decoration: widget.boxDecoration ?? BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: CustomTheme.color.dropdownBackgroundColor,
          border: Border.all(width: 1, color: CustomTheme.color.dropdownOutlineColor)
      ),
      child: DropdownButton<BaseDropDownItemModel>(
        isExpanded: widget.isExpand,
        icon: Container(
          child: Icon(Icons.keyboard_arrow_down_outlined, color: CupertinoColors.white,),
        ),
        dropdownColor: CustomTheme.color.dropdownBackgroundColor,
        style: widget.textStyle ?? CustomTheme.textStyle.whitew600.copyWith(fontSize: 16, color: CustomTheme.color.dropdownValueColor),
        underline: Container(),
        elevation: 0,
        value: selectedItemModel,
        items: widget.dropdownItemList.map<DropdownMenuItem<BaseDropDownItemModel>> ((BaseDropDownItemModel model) {
          return DropdownMenuItem<BaseDropDownItemModel>(
              value: model,
              child: Text(model.title)
          );
        }).toList(),
        onChanged: (model) {
          if(model == null) return;

          setState(() {
            selectedItemModel = model;
            widget.itemSelectedCallback(selectedItem: selectedItemModel);
          });

        },
      ),
    );
  }
}
