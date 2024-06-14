
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:riverpod_clean_architecture_lib/managers/view_route_manager.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';

class FullImageDialogScreen extends StatelessWidget {
  final String imageUrl;
  Color? closeBtnColor;

  FullImageDialogScreen({
    Key? key,
    required this.imageUrl,
    this.closeBtnColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: CupertinoColors.black,
      padding: EdgeInsets.only(top: SizeUtil.statusBarH),
      child: Stack(
        children: [

          Align(
            alignment: Alignment.center,
            child: PhotoView(
              imageProvider: CachedNetworkImageProvider(imageUrl),
            ),
          ),

          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () => RouteManager.instance.pop(context: context),
              child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.transparent,
                  child: Icon(Icons.close_rounded, color: closeBtnColor ?? CupertinoColors.white,)
              ),
            ),
          ),


        ],
      )
    );
  }
}
