import 'package:DungxApp/modules/space_detail/space_detail_controller.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:DungxApp/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';

class SpaceDetail extends GetView<SpaceDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Theme.of(context).backgroundColor,
            child: Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2,
                    ))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          _headerWidget(context),
                          _contentWidget(context),
                          _tabBarWidget(context),
                        ],
                      ),
                    ),
            )),
        bottomNavigationBar: Obx(() => controller.isLoading.value
            ? SizedBox.shrink()
            : Container(
                color: Theme.of(context).backgroundColor,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 30),
                child: Row(
                  children: [
                    Button(
                      width: (Constants(context).width - 56) / 2,
                      title: 'Make Enquiry',
                      onPress: () {},
                    ),
                    SizedBox(width: 16),
                    Button(
                      width: (Constants(context).width - 56) / 2,
                      title: 'Booking',
                      onPress: () {},
                    ),
                  ],
                ),
              )));
  }

  Widget _headerWidget(BuildContext context) {
    final location = controller.location.value;
    final gallery = location.gallery ??
        [location.thumbnail ?? StorageConstants.defaultLogo];
    return Container(
        child: Stack(
      children: [
        ImageSlideshow(
          width: Constants(context).width,
          height: 300,
          initialPage: 0,
          indicatorColor: Colors.white,
          indicatorBackgroundColor: Colors.grey[700],
          children: gallery.map<Widget>((entry) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(entry), fit: BoxFit.cover)),
            );
          }).toList(),
          isLoop: true,
        ),
        Positioned(
            top: 50,
            child: Container(
                width: Constants(context).width,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          AppIcon.ic_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          AppIcon.ic_favourite,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    )
                  ],
                )))
      ],
    ));
  }

  Widget _contentWidget(BuildContext context) {
    final location = controller.location.value;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location.name, style: Theme.of(context).textTheme.headline1),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 48,
                width: 48,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(location.rating.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headline2),
                    Text('${location.totalReview} Reviews',
                        style: TextStyle(fontSize: 8)),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                AppIcon.ic_time,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text('Open:',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .merge(TextStyle(color: AppColors.primary))),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('(Mon - Fri) 07:00 am - 07:00 pm',
                      style: Theme.of(context).textTheme.bodyText1),
                  const SizedBox(height: 5),
                  Text('(Sat) 07:00 am - 07:00 pm',
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                AppIcon.ic_location,
                size: 18,
              ),
              const SizedBox(width: 10),
              SizedBox(
                width: Constants(context).width - 70,
                child: Text(location.address,
                    style: Theme.of(context).textTheme.bodyText1),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                AppIcon.ic_phone_number,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(location.phoneContact,
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
          Container(
              child: location.description == null
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        const SizedBox(height: 20),
                        Text('About Space',
                            style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 16),
                        Container(
                          width: Constants(context).width - 32,
                          decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 0.3,
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Text(location.description,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      ],
                    )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amenities', style: Theme.of(context).textTheme.headline3),
              Text('View all',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .merge(TextStyle(color: AppColors.primary))),
            ],
          ),
          const SizedBox(height: 16),
          Container(
              height: 140,
              width: Constants(context).width - 32,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0.3,
                    blurRadius: 3,
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Wrap(
                children: [1, 2, 3, 4, 1, 1].map((entry) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: (Constants(context).width - 100) / 2,
                    child: Row(
                      children: [
                        const Icon(
                          AppIcon.ic_profile,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text('Monitor',
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  );
                }).toList(),
              )),
        ],
      ),
    );
  }

  Widget _tabBarWidget(BuildContext context) {
    TabController _tabController;

    final List<Tab> myTabs = <Tab>[
      const Tab(text: 'Service'),
      const Tab(text: 'Reviews')
    ];
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 220,
      width: Constants(context).width - 40,
      child: DefaultTabController(
          length: myTabs.length,
          child: Column(
            children: [
              SizedBox(
                width: Constants(context).width - 40,
                child: TabBar(
                    indicatorColor: AppColors.primary,
                    unselectedLabelColor: Colors.grey,
                    tabs: myTabs),
              ),
              SizedBox(height: 16),
              Expanded(
                child: TabBarView(children: [
                  Container(
                    height: 100,
                    child: ImageSlideshow(
                      width: Constants(context).width - 40,
                      initialPage: 0,
                      indicatorColor: Colors.white,
                      indicatorBackgroundColor: Colors.grey[700],
                      children: [1, 2, 3].map((entry) {
                        return Container(
                            height: 100,
                            width: Constants(context).width - 32,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0.3,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 12),
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 12),
                                  Text('Meeting',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                                  SizedBox(height: 12),
                                  Text('30,000 - 50,000 vnd',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .merge(TextStyle(
                                              color: AppColors.primary)))
                                ],
                              ),
                            ));
                      }).toList(),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryYellowTale,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  AppIcon.ic_edit,
                                  size: 18,
                                  color: AppColors.primary,
                                ),
                                SizedBox(width: 5),
                                Text('Write Review',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primary,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(height: 16),
            ],
          )),
    );
  }
}
