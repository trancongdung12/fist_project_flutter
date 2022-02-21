import 'package:DungxApp/api/setting_repository.dart';
import 'package:DungxApp/core/app_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SettingRepository settingRepository;

  SettingController({required this.settingRepository});
  final appcontroller = Get.find<AppController>();
  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    appcontroller.setIsLogin(false);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
