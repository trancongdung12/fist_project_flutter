import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/modules/home/home_controller.dart';
import 'package:DungxApp/routes/app_pages.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:DungxApp/widgets/image_slider.dart';
import 'package:DungxApp/modules/home/widgets/news_item.dart';
import 'package:DungxApp/modules/home/widgets/popular_item.dart';
import 'package:DungxApp/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class Serivice {
  String name;
  IconData icon;
  Serivice(this.name, this.icon);
}

class Home extends GetView<HomeController> {
  final appcontroller = Get.find<AppController>();
  final List<Serivice> _services = [
    Serivice('Desk', AppIcon.ic_desk),
    Serivice('Meet up', AppIcon.ic_meetup),
    Serivice('Office', AppIcon.ic_office),
    Serivice('Co-living', AppIcon.ic_coliving),
    Serivice('Sport Center', AppIcon.ic_gym),
    Serivice('Other', AppIcon.ic_more),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 230,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/header.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  _seachWidget(context),
                  _currentLocation(),
                  _serviceWidget(context),
                ],
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _bannerWidget(context),
                  _titleWidget(name: 'NearBy'),
                  _nearByWidget(context),
                  _titleWidget(name: 'News & Event', mTop: 6),
                  const SizedBox(height: 18),
                  _newsWidget(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _seachWidget(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.SEARCH),
      child: Container(
          height: 44,
          margin:
              const EdgeInsets.only(top: 60, bottom: 16, left: 20, right: 20),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: const [
              Icon(
                AppIcon.ic_search,
                size: 20,
                color: AppColors.mainL3,
              ),
              SizedBox(width: 10),
              Text(
                'Search address or space name',
                style: TextStyle(color: AppColors.mainL3),
              ),
            ],
          )),
    );
  }

  Widget _currentLocation() {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: Obx(() => appcontroller.currentAddress.value.isNotEmpty
          ? Row(children: [
              const Icon(
                AppIcon.ic_location,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                appcontroller.currentAddress.value,
                style: const TextStyle(color: Colors.white),
              )
            ])
          : Row(children: const [
              SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              ),
              SizedBox(width: 5),
              Text(
                'Enable location',
                style: TextStyle(color: Colors.white),
              )
            ])),
    );
  }

  Widget _serviceWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      height: 94,
      width: Constants(context).width - 40,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 3,
          ),
        ],
      ),
      child: ListView.builder(
          itemCount: _services.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => SizedBox(
                width: (Constants(context).width - 40) / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(44 / 2),
                      ),
                      child: Icon(
                        _services[index].icon,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _services[index].name,
                      style: const TextStyle(fontSize: 12),
                    )
                  ],
                ),
              )),
    );
  }

  Widget _bannerWidget(BuildContext context) {
    return Obx(() => controller.isLoadingBanner.value
        ? Skelton(mTop: 12, height: 160, width: Constants(context).width - 40)
        : Container(
            margin: const EdgeInsets.only(top: 12, left: 20, right: 20),
            child: ImageSlideshow(
              width: Constants(context).width,
              height: 160,
              initialPage: 0,
              indicatorColor: Colors.white,
              indicatorBackgroundColor: Colors.grey[700],
              children: controller.banner.results.map((entry) {
                return ImageSlider(
                  url: entry.imageUrl,
                  nameSpace: entry.name,
                );
              }).toList(),
              isLoop: true,
            ),
          ));
  }

  Widget _nearByWidget(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Obx(() => controller.isLoadingNearBy.value
            ? Wrap(
                spacing: 15,
                children: [1, 2, 3, 4].map((entry) {
                  return Skelton(
                    width: (Constants(context).width - 55) / 2,
                    mBottom: 10,
                    height: 140,
                  );
                }).toList(),
              )
            : Wrap(
                spacing: 15,
                children: controller.nearBy.results.take(4).map((entry) {
                  return PopularItem(
                    location: entry,
                    onPress: (locationId) {
                      Get.toNamed(Routes.SPACE_DETAIL, arguments: locationId);
                    },
                  );
                }).toList(),
              )));
  }

  Widget _newsWidget(BuildContext context) {
    return Obx(() => controller.isLoadingEvent.value
        ? Column(
            children: [1, 2, 3, 4].map((entry) {
            return Skelton(
              width: Constants(context).width - 40,
              mBottom: 16,
              height: 120,
            );
          }).toList())
        : Column(
            children: controller.events.results.map((entry) {
              return NewsItem(event: entry);
            }).toList(),
          ));
  }

  Widget _titleWidget({required String name, double? mTop}) {
    return Container(
      margin: EdgeInsets.only(top: mTop ?? 26, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
          Row(children: const [
            Text(
              'View all',
              style: TextStyle(color: AppColors.primary, fontSize: 12),
            ),
            SizedBox(width: 10),
            Icon(
              AppIcon.ic_arrow_next,
              size: 20,
              color: AppColors.primary,
            ),
          ])
        ],
      ),
    );
  }
}
