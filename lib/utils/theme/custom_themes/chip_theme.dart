import 'package:ecommerceapplication/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class YChipTheme {
  YChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: YColors.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: Colors.white);

  static ChipThemeData darkChipTheme = const ChipThemeData(
      disabledColor: YColors.darkerGrey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: YColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      checkmarkColor: Colors.white);
}
