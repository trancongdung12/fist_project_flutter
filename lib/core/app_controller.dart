import 'package:DungxApp/core/theme/dark_theme.dart';
import 'package:DungxApp/core/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppController extends GetxController {
  late ThemeData themeData;
  late Locale localeData;

  final box = GetStorage();
  final isLogin = false.obs;
  var currentLocation = Position(
          latitude: 0,
          longitude: 0,
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0,
          timestamp: DateTime.now())
      .obs();
  final currentAddress = ''.obs;

  @override // called when you use Get.put before running app
  void onInit() {
    super.onInit();
    _restoreTheme();
    _restoreLocale();
    _initPosition();
    _isExistToken();
  }

  void _isExistToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if (token != null) {
      isLogin.value = true;
    }
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

  void setIsLogin(bool isToken) {
    isLogin.value = isToken;
  }

  void _initPosition() async {
    Position position = await _getGeoLocationPosition();
    if (position.latitude != null) {
      currentLocation = position;
      currentAddress.value = await _getAddressFromLatLong(position);
    }
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<String> _getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemarks[0];
    return '${place.street}, ${place.subLocality}, ${place.locality}';
  }
}
