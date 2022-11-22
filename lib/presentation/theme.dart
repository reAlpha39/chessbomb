import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';
import 'material_custom_color.dart';

ThemeData theme() {
  return ThemeData.from(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: customMaterialColor(ColorStyle.primaryColor),
    ),
  ).copyWith(
    primaryColor: ColorStyle.primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    scaffoldBackgroundColor: ColorStyle.backgroundColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorStyle.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorStyle.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      hintStyle: TextStyle(
        color: Color(0xFFC4C4C4),
      ),
      focusColor: ColorStyle.greyColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorStyle.greyColor, //thereby
    ),
  );
}
