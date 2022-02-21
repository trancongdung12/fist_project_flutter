import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/modules/favourite/favourite_controller.dart';
import 'package:DungxApp/modules/favourite/widgets/pin_item.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:DungxApp/widgets/not_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourite extends GetView<FavouriteController> {
  final appcontroller = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Favourites', style: Theme.of(context).textTheme.headline3),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.3,
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: Obx(
          () => appcontroller.isLogin.value
              ? Column(
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('My Favourite Space',
                              style: TextStyle(fontSize: 18)),
                          PinItem()
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 16, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Favourites List',
                              style: TextStyle(fontSize: 18)),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 0.3,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 14),
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              image: const DecorationImage(
                                                  image: NetworkImage(
                                                    'https://odinland.com/wp-content/uploads/2021/03/enouvo-space-an-nhon-5.jpg',
                                                  ),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: Constants(context).width -
                                                  138,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Surf Space',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Container(
                                                    height: 24,
                                                    width: 24,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.primary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: const Text(
                                                      '4.8',
                                                      style: TextStyle(
                                                          fontSize: 8,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              '16 An Hải Bắc, Sơn Trà, Đà Nẵng',
                                              style: TextStyle(fontSize: 12),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )),
                                Container(
                                  margin: const EdgeInsets.only(top: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Icon(
                                        AppIcon.ic_price,
                                        size: 20,
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        AppIcon.ic_favourite,
                                        size: 24,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : const NotLoginScreen(
                  image: 'assets/images/emptyFavourite.png',
                  title: 'Oops!',
                  desc: "You haven't like any space",
                  note: 'Please login to view your favourite spaces',
                ),
        ));
  }
}
