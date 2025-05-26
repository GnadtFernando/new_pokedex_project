import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:new_pokedex_project/common/consts/assets_strings.dart';
import 'package:new_pokedex_project/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: Center(
        child: Lottie.asset(
          AssetsStrings.pokeballAnimation,
          width: 200.w,
          height: 200.h,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
