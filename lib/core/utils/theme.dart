import 'package:bookapp/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class AppTheme{
  static ThemeData get lightTheme => ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.primary,
    fontFamily: FontConstants.fontFamily,
    appBarTheme:  const AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      surfaceTintColor: AppColors.white,
      foregroundColor: AppColors.black,
      centerTitle: true,
      shadowColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
      toolbarTextStyle: TextStyle(color: AppColors.white),
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );
}