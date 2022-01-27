import 'package:DungxApp/core/app_controller.dart';
import 'package:DungxApp/modules/setting/setting_controller.dart';
import 'package:DungxApp/modules/setting/widgets/bottom_icon.dart';
import 'package:DungxApp/modules/setting/widgets/row_text.dart';
import 'package:DungxApp/routes/app_pages.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends GetView<SettingController> {
  final appcontroller = Get.find<AppController>();

  Widget _titleWidget(BuildContext context, title) {
    return Container(
      width: Constants(context).width,
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _modalBottomSheetMenu() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return Container(
              height: 350.0,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: const Center(
                    child: Text("This is a modal sheet"),
                  )),
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text('SETTINGS'.tr, style: Theme.of(context).textTheme.headline3),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowText(
              title: "PROFILE".tr,
              onPress: () {
                Get.toNamed(Routes.PROFILE);
              },
            ),
            const SizedBox(height: 15),
            _titleWidget(context, 'ABOUTAPP'.tr),
            RowText(
              title: "LANGUAGE".tr,
              onPress: () {
                final act = CupertinoActionSheet(
                    title: Text('SELECT_LANGUAGE'.tr),
                    actions: <Widget>[
                      CupertinoActionSheetAction(
                        child: Text('ENGLISH'.tr),
                        onPressed: () {
                          appcontroller.changeLanguage('en_US');
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoActionSheetAction(
                        child: Text('VIETNAMESE'.tr),
                        onPressed: () {
                          appcontroller.changeLanguage('vi_VN');
                          Navigator.pop(context);
                        },
                      )
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: Text('CANCEL'.tr),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ));
                showCupertinoModalPopup(
                    context: context, builder: (BuildContext context) => act);
                // _modalBottomSheetMenu();
                // appcontroller.changeLanguage('en_US');
              },
            ),
            RowText(
              title: "NOTIFICATION".tr,
              onPress: () {},
            ),
            RowText(
              title: "INTRODUCTION".tr,
              onPress: () {},
            ),
            const SizedBox(height: 15),
            _titleWidget(context, 'SERCURITY'.tr),
            RowText(
              title: "PRIVACY_POLICY".tr,
              onPress: () {},
            ),
            RowText(
              title: "TERM_CONDITION".tr,
              onPress: () {},
            ),
            RowText(
              title: "SHARE_FRIEND".tr,
              onPress: () {},
            ),
            const SizedBox(height: 15),
            RowText(
              title: "LOGOUT".tr,
              onPress: () {
                controller.logout();
              },
            ),
            const SizedBox(height: 10),
            const BottomIcon()
          ],
        ),
      ),
    );
  }
}
