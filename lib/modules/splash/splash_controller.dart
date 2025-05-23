import 'dart:developer';

import 'package:get/get.dart';
import 'package:new_pokedex_project/common/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    log('Loading iniciado');
    super.onInit();
    _loading();
  }

  Future<void> _loading() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAndToNamed(AppRoutes.pokedex);
  }
}
