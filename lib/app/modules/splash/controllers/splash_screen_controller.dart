import 'package:demo_use/app/routes/app_pages.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController {
  @override
  void onInit() {
    _delayTime();

    super.onInit();
  }

  void _delayTime(){
    Future.delayed(const Duration(seconds: 2),(){

      Get.offAndToNamed(AppRoutes.dashboard);
    });
  }

}
