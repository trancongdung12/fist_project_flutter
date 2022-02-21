import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/modules/booking/booking_controller.dart';
import 'package:DungxApp/modules/booking/widgets/booking_item.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/widgets/not_login_screen.dart';
import 'package:DungxApp/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Booking extends GetView<BookingController> {
  final appcontroller = Get.find<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('My bookings', style: Theme.of(context).textTheme.headline3),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.3,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Obx(
          () => appcontroller.isLogin.value
              ? Column(
                  children: [
                    _bookingListWidget(context),
                  ],
                )
              : const NotLoginScreen(
                  image: 'assets/images/emptyBooking.png',
                  title: 'Oops!',
                  desc: "Your booking is empty",
                  note: 'Please login to view your bookings',
                ),
        ));
  }

  Widget _bookingListWidget(BuildContext context) {
    return Container(
        height: Constants(context).height - 193,
        padding: const EdgeInsets.only(top: 16),
        child: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: Column(
                    children: [1, 2, 3, 4].map((entry) {
                      return Skelton(
                        width: (Constants(context).width - 40),
                        mTop: 16,
                        height: 140,
                      );
                    }).toList(),
                  ),
                )
              : ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => BookingItem(
                        booking: controller.bookings.results[index],
                      )),
        ));
  }
}
