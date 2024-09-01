import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class YShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: YColors.grey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horizontalProductShadow = BoxShadow(
      color: YColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
