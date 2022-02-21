import 'package:DungxApp/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(milliseconds: 2000));
    Get.toNamed(Routes.BOTTOM_TAB);
  }
}
