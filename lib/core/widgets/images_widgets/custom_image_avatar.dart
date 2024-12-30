import 'package:balance_project/imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomImageAvatar extends StatelessWidget {
  const CustomImageAvatar({
    Key? key,
    this.backgroundColor,
    required this.radius,
    required this.showAssetImage,
    required this.iconUrl,
    this.imageColor,
    this.imageSize,
    this.applyMask = false,
  }) : super(key: key);
  final Color? backgroundColor;
  final double radius;
  final bool showAssetImage;
  final String? iconUrl;
  final Color? imageColor;
  final Size? imageSize;
  final bool applyMask;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: imageSize?.height ?? radius * 2 - AppDimensions.w(0),
          width: imageSize?.width ?? radius * 2 - AppDimensions.w(0),
          child: Builder(
            builder: (BuildContext context) {
              if (showAssetImage) {
                if (iconUrl == null) {
                  return const LoadingImageWidget();
                } else {
                  print(iconUrl);
                  return Center(
                    child: SizedBox(
                      height: imageSize?.height ??
                          radius * 1.5 - AppDimensions.w(5),
                      width:
                          imageSize?.width ?? radius * 1.5 - AppDimensions.w(5),
                      child: SvgPicture.asset(
                        iconUrl!,
                        color: imageColor ??
                            (ThemeManager.isDarkMode(context)
                                ? Colors.white
                                : null),
                      ),
                    ),
                  );
                }
              } else {
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints cons) {
                    return Center(
                      child: ClipOval(
                        // borderRadius: BorderRadius.circular(1000),
                        child: Container(
                          color: backgroundColor,
                          child: CustomCachedImage(
                            applyMask: applyMask,
                            imageSize: Size(radius, radius),
                            imageUrl: iconUrl,
                            fit: BoxFit.cover,
                            imageColor: imageColor,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
