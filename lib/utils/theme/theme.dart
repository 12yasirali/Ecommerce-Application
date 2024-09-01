import 'package:ecommerceapplication/utils/theme/custom_themes/appbar_them.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/chip_theme.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/outlined_button_thee.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/text_Theme.dart';
import 'package:ecommerceapplication/utils/theme/custom_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class YAppTheme {
  YAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: YTextTheme.lightTextTheme,
      chipTheme: YChipTheme.lightChipTheme,
      checkboxTheme: YCheckBoxTheme.lightCheckboxTheme,
      appBarTheme: YAppbarTheme.lightAppbarTheme,
      bottomSheetTheme: YBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: YElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: YOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: YTextFromFieldTheme.lightTextFromFieldTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: YTextTheme.darkTextTheme,
      chipTheme: YChipTheme.darkChipTheme,
      checkboxTheme: YCheckBoxTheme.darkCheckboxTheme,
      appBarTheme: YAppbarTheme.darkAppbarTheme,
      bottomSheetTheme: YBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: YElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: YOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: YTextFromFieldTheme.darkTextFromFieldTheme);
}
