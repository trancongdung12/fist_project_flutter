import 'package:DungxApp/modules/booking/booking.dart';
import 'package:DungxApp/modules/bottomTab/bottom_tab_binding.dart';
import 'package:DungxApp/modules/bottomtab/bottom_tab.dart';
import 'package:DungxApp/modules/favourite/favourite.dart';
import 'package:DungxApp/modules/home/home_page.dart';
import 'package:DungxApp/modules/login/auth_binding.dart';
import 'package:DungxApp/modules/login/login.dart';
import 'package:DungxApp/modules/mailbox/mailbox.dart';
import 'package:DungxApp/modules/mailbox/pages/inbox.dart';
import 'package:DungxApp/modules/setting/pages/profile.dart';
import 'package:DungxApp/modules/setting/setting.dart';
import 'package:DungxApp/modules/splash/splash_binding.dart';
import 'package:DungxApp/modules/splash/splash_screen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.BOTTOM_TAB,
      page: () => BottomTab(),
      binding: BottomTabBinding(),
      children: [
        GetPage(
          name: Routes.HOME,
          page: () => Home(),
        ),
        GetPage(
          name: Routes.FAVOURITE,
          page: () => Favourite(),
        ),
        GetPage(
          name: Routes.BOOKING,
          page: () => Booking(),
        ),
        GetPage(
          name: Routes.MAILBOX,
          page: () => Mailbox(),
        ),
        GetPage(
          name: Routes.SETTING,
          page: () => Setting(),
        ),
      ],
    ),
    GetPage(
      name: Routes.INBOX,
      page: () => const Inbox(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const Profile(),
    ),
  ];
}
