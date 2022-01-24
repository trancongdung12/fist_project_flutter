import 'package:DungxApp/api/setting_repository.dart';
import 'package:DungxApp/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingController extends GetxController {
  final SettingRepository settingRepository;

  SettingController({required this.settingRepository});

  @override
  void onInit() {
    super.onInit();
  }

  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
