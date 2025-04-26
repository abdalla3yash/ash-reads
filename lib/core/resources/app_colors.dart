import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color transparent = Color(0x00000000);
  static const Color grey = Color(0xffA7A5AF);
  static const Color black = Colors.black;
  static const Color white = Color(0xffFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color primary = Color(0xffEB5757);
  static const Color secandry = Color(0xFF80D48F);
  static const Color yellow = Color(0xFFffe259);
  static const Color red = Color(0xffFF6969); 
  static const Color favouriteColor = Color(0xffED0606);
  static const Color darkGrey = Color(0xff636363);
  static const Color hintTextColor = Color(0xffA7A7A8);
  static const Color textColor = Color(0xff3B2F6F);
  static const Color offWhiteColor = Color(0xffF6F4FF);  


  static Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
  }
}

