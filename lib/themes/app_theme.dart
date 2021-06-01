import 'package:flutter/material.dart';
import 'package:submission/themes/app_color.dart';

final appTheme = ThemeData(
  primaryColor: AppColor.primary,
  accentColor: AppColor.accent,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primary,
    foregroundColor: AppColor.onPrimary,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
