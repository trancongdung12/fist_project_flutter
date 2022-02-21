import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/utils/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig().screenWidth,
        height: SizeConfig().screenHeight,
        decoration: const BoxDecoration(color: AppColors.primary),
        child: Center(
          child: Image.asset(
            'assets/images/splash.png',
            width: 170,
            height: 208,
          ),
        ),
      ),
    );
  }
}
