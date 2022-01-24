import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: controller.themeData,
      locale: controller.localeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
