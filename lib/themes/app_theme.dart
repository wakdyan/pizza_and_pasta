import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_text_style.dart';

final appTheme = ThemeData(
  primaryColor: AppColor.primary,
  accentColor: AppColor.accent,
  appBarTheme: AppBarTheme(
    textTheme: textTheme.copyWith(
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: AppColor.onPrimary,
      ),
    ),
    iconTheme: IconThemeData(color: AppColor.onPrimary),
  ),
  backgroundColor: AppColor.background,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(primary: AppColor.onPrimary),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColor.primary,
      onPrimary: AppColor.onPrimary,
      minimumSize: Size(36, 48),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primary,
    foregroundColor: AppColor.onPrimary,
  ),
  textTheme: textTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
