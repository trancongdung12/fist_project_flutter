import 'package:DungxApp/api/booking_repository.dart';
import 'package:DungxApp/api/favourite_repository%20copy.dart';
import 'package:DungxApp/api/home_responsitory.dart';
import 'package:DungxApp/api/mailbox_reponsitory.dart';
import 'package:DungxApp/api/setting_repository.dart';
import 'package:DungxApp/modules/booking/booking_controller.dart';
import 'package:DungxApp/modules/favourite/favourite_controller.dart';
import 'package:DungxApp/modules/home/home_controller.dart';
import 'package:DungxApp/modules/mailbox/mailbox_controller.dart';
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

    Get.put<FavouriteController>(
      FavouriteController(
        favouriteRepository: FavouriteRepository(),
      ),
    );

    Get.put<BookingController>(
      BookingController(
        bookingRepository: BookingRepository(),
      ),
    );

    Get.put<MailBoxController>(
      MailBoxController(
        mailboxRepository: MailBoxRepository(),
      ),
    );

    Get.put<SettingController>(SettingController(
      settingRepository: SettingRepository(),
    ));
  }
}
