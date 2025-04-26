import 'dart:async';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bookapp/core/navigation/navigation.dart';
import 'package:bookapp/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Timer(Duration(seconds: 5),()=> NavigationService.pushReplacement(Routes.booksScreen));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child:  CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 186.r,
              ).animate().slideY(begin: -0.5, end: 0.2, duration: NumDurationExtensions(0.5).seconds).then(delay: NumDurationExtensions(600).milliseconds).slideY(end: -0.3, duration: NumDurationExtensions(0.5).seconds).then(delay: NumDurationExtensions(600).milliseconds).slideY(end: 0.1, duration: NumDurationExtensions(0.5).seconds).then(delay: NumDurationExtensions(1).seconds).scaleXY(end: 20, duration: NumDurationExtensions(1).seconds).then(delay: NumDurationExtensions(0.6).seconds),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 140.w, child: Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(AppImages.imgWhiteLogo))),
                12.heightBox,
              Text('Ash Reads').textStyle(context.displaySmall!.semiBold.copyWith(color: AppColors.white)),
              ],
            ),
          ).animate().fadeIn(delay: NumDurationExtensions(1).seconds, duration: NumDurationExtensions(900).milliseconds).slideX(begin: 3, duration: NumDurationExtensions(1).seconds),
        
        ],
      ),
    );
  }
}
    
    