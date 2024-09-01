import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerceapplication/commons/widgets/shimmers/shimmer_loader.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helperFunction.dart';

class YCircularImage extends StatelessWidget {
  const YCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = const EdgeInsets.all(YSizes.sm),
    this.fit = BoxFit.cover,
    required this.imageUrl,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.showImageColor = false,
    this.onTap,
    this.border,
    this.applyImageRadius = true,
    this.overlayColor,
    this.effectHeight = 55,
    this.effectWidth = 55,
  });

  final double width, height, effectHeight, effectWidth;
  final EdgeInsetsGeometry padding;
  final BoxFit? fit;
  final String imageUrl;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final bool showImageColor;
  final Color? overlayColor;
  final VoidCallback? onTap;
  final BoxBorder? border;
  final bool applyImageRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = YHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor ?? (isDark ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => YShimmerEffect(
                            width: effectWidth, height: effectHeight),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                : Image(
                    image: AssetImage(imageUrl),
                    color: showImageColor
                        ? null
                        : (isDark ? YColors.white : YColors.black),
                    fit: fit,
                  ),
          ),
        ),
      ),
    );
  }
}
