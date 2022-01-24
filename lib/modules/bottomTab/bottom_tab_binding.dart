import 'package:DungxApp/api/home_responsitory.dart';
import 'package:DungxApp/api/setting_repository.dart';
import 'package:DungxApp/modules/home/home_controller.dart';
import 'package:DungxApp/modules/setting/setting_controller.dart';
import 'package:get/get.dart';

class BottomTabBinding implements Bindings {
  @override
  void dependencies() {
    // bottom navigation bar screens
    Get.put<HomeController>(
      HomeController(
        homeRepository: HomeRepository(),
      ),
    );

    Get.put<SettingController>(SettingController(
      settingRepository: SettingRepository(),
    ));
  }
}
