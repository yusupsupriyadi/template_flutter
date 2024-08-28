import 'package:get/get.dart';
import 'package:template_flutter/core.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    moveToHome();
    super.onInit();
  }

  void moveToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Get.offAllNamed(Routes.LOGIN),
    );
  }
}
