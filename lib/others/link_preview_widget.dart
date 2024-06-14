
import 'package:any_link_preview/any_link_preview.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daniel_ui_template_lib/daniel_ui_template_lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_clean_architecture_lib/utils/size_util.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkPreviewWidget extends StatelessWidget {

  final String link;

  final double width;

  final double imageHeight;

  final Color backgroundColor;

  final Color borderColor;

  final TextStyle? titleTextStyle;

  final TextStyle? bodyTextStyle;

  const LinkPreviewWidget(
      {
        super.key,
        required this.link,
        required this.width,
        required this.imageHeight,
        required this.backgroundColor,
        required this.borderColor,
        this.titleTextStyle,
        this.bodyTextStyle
      }
      );

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: createPreviewScreen(),
        builder: (context, AsyncSnapshot<Widget> snapshot) { // 수정된 부분
          if (snapshot.hasData) { // 수정된 부분
            return snapshot.data!; // 수정된 부분
          } else {
            return Container(); // 수정된 부분
          }
        },
    );
  }

  Future<Widget> createPreviewScreen() async {

    Metadata? meta = await AnyLinkPreview.getMetadata(link: link);

    if(meta == null) return Container();

  	return GestureDetector(
      onTap: () async {
        if(await canLaunchUrl(Uri.parse(link))) {
          await launchUrl(Uri.parse(link));
        }
      },
  	  child: IntrinsicHeight(
  	    child: Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: backgroundColor,
        border: Border.all(width: 0.5, color: borderColor)
      ),
  	    	child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: imageHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              child: CachedNetworkImage(
                imageUrl: meta.image ?? "",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return Image.asset(CustomTheme.imagePath.IMG_CACHED_NETWORK_IMAGE_WARNING, fit: BoxFit.cover,);
                },
              ),
            ),
          ),

          SizedBox(height: 12.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, ),
            child: Text(
              (meta.title ?? ""),
              style: titleTextStyle ?? CustomTheme.textStyle.linkPreViewTitleTextStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 8.h),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              (meta.desc  ?? ""),
              style: bodyTextStyle ?? CustomTheme.textStyle.linkPreViewBodyTextStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: 12.h),
        ],
      )
  	    ),
  	  ),
  	);
  }


}
