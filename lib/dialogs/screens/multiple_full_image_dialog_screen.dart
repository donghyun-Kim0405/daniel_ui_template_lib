
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';
import '../../appbars/base_app_bar.dart';

class MultipleFullImageDialogScreen extends StatelessWidget {

  final List<String> imageUrlList;

  const MultipleFullImageDialogScreen({Key? key, required this.imageUrlList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.black,
      margin: EdgeInsets.only(top: SizeUtil.statusBarH),
      child: Column(
        children: [
          BaseAppBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(String url in imageUrlList)
                    createImageWidget(url: url),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createImageWidget({required String url}) {
  	return Container(
      width: double.infinity,
  		child: CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => Image.asset(
          CustomTheme.imagePath.IMG_CACHED_NETWORK_IMAGE_WARNING,
          fit: BoxFit.cover,
          color: CupertinoColors.white,
        ),
      )
  	);
  }
}
