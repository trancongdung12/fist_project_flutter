import 'package:DungxApp/modules/setting/setting_controller.dart';
import 'package:DungxApp/modules/setting/widgets/bottom_icon.dart';
import 'package:DungxApp/modules/setting/widgets/row_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.5,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowText(
              title: "Profile",
              onPress: () {},
            ),
            Divider(
              thickness: 13,
              color: Colors.grey[100],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                'About app',
                style: TextStyle(fontSize: 20),
              ),
            ),
            RowText(
              title: "Language",
              onPress: () {},
            ),
            RowText(
              title: "Notification",
              onPress: () {},
            ),
            RowText(
              title: "Introduction",
              onPress: () {},
            ),
            Divider(
              thickness: 10,
              color: Colors.grey[100],
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 16),
              child: Text(
                'Sercurity',
                style: TextStyle(fontSize: 20),
              ),
            ),
            RowText(
              title: "Privacy & Policy",
              onPress: () {},
            ),
            RowText(
              title: "Term & Condition",
              onPress: () {},
            ),
            RowText(
              title: "Share with friend",
              onPress: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Divider(
                thickness: 10,
                color: Colors.grey[100],
              ),
            ),
            RowText(
              title: "Log Out",
              onPress: () {
                controller.logout();
              },
            ),
            Divider(
              thickness: 10,
              color: Colors.grey[100],
            ),
            const BottomIcon()
          ],
        ),
      ),
    );
  }
}
