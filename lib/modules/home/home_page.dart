import 'package:DungxApp/modules/home/home_controller.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:DungxApp/widgets/image_slider.dart';
import 'package:DungxApp/modules/home/widgets/news_item.dart';
import 'package:DungxApp/modules/home/widgets/popular_item.dart';
import 'package:DungxApp/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Serivice {
  String name;
  IconData icon;
  Serivice(this.name, this.icon);
}

class Home extends GetView<HomeController> {
  final List<Serivice> _services = [
    Serivice('Desk', AppIcon.ic_desk),
    Serivice('Meet up', AppIcon.ic_meetup),
    Serivice('Office', AppIcon.ic_office),
    Serivice('Co-living', AppIcon.ic_coliving),
    Serivice('Sport Center', AppIcon.ic_gym),
    Serivice('Other', AppIcon.ic_more),
  ];

  Widget _seachWidget() {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(top: 60, bottom: 16, left: 20, right: 20),
      child: TextField(
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: "Search address or space name",
          prefixIcon: Icon(
            AppIcon.ic_search,
            size: 20,
            color: Colors.grey[500],
          ),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Colors.white, width: 0.0),
          ),
        ),
      ),
    );
  }

  Widget _serviceWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      height: 94,
      width: Constants(context).width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
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
                  return PopularItem(location: entry);
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
                  _seachWidget(),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Row(children: const [
                      Icon(
                        AppIcon.ic_location,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        '43 Nguyen Thi Ke, Son Tra, Da Nang',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
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
                  Container(
                    margin: const EdgeInsets.only(top: 26, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nearby',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Row(children: const [
                          Text(
                            'View all',
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 12),
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
                  ),
                  _nearByWidget(context),
                  Container(
                    margin: const EdgeInsets.only(top: 6, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'News & Event',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                        Row(children: const [
                          Text(
                            'View all',
                            style: TextStyle(
                                color: AppColors.primary, fontSize: 12),
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
                  ),
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
}
