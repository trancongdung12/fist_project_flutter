import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/modules/booking/booking_controller.dart';
import 'package:DungxApp/modules/booking/widgets/booking_item.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/widgets/not_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Booking extends GetView<BookingController> {
  final appcontroller = Get.find<AppController>();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
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
        child: Obx(() => SmartRefresher(
              controller: refreshController,
              enablePullUp: true,
              onRefresh: () async {
                if (controller.isLoading.value) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                if (controller.isLoading.value) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              child: LazyLoadScrollView(
                onEndOfPage: controller.loadMore,
                isLoading: controller.isLoading.value,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.bookings.length,
                  itemBuilder: (context, index) {
                    return BookingItem(
                      booking: controller.bookings[index],
                    );
                  },
                ),
              ),
            )));
  }
}
