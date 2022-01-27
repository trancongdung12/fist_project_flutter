import 'package:DungxApp/core/theme/dark_theme.dart';
import 'package:DungxApp/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  late ThemeData themeData;
  late Locale localeData;

  final box = GetStorage();

  @override // called when you use Get.put before running app
  void onInit() {
    super.onInit();
    _restoreTheme();
    _restoreLocale();
  }

  void _restoreTheme() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    bool isDark =
        box.read('isDark') ?? false; // null check for first time running this
    if (isDarkMode) {
      themeData = DarkThemeData;
    } else {
      themeData = LightThemeData;
    }
  }

  void storeThemeSetting(bool isDark) {
    box.write('isDark', isDark);
  }

  void toggleDarkMode() {
    bool isDark = themeData == DarkThemeData;
    if (!isDark) {
      themeData = DarkThemeData;
    } else {
      themeData = LightThemeData;
    }
    storeThemeSetting(!isDark);
    Get.changeTheme(themeData);
  }

  void _restoreLocale() {
    String languageCode = box.read('languageCode') ?? 'en_US';
    localeData = Locale(languageCode);
  }

  void storeLanguageSetting(String languageCode) {
    box.write('languageCode', languageCode);
  }

  void changeLanguage(String languageCode) {
    if (languageCode != localeData.languageCode) {
      localeData = Locale(languageCode);
      storeLanguageSetting(languageCode);
      Get.updateLocale(localeData);
    }
  }
}
