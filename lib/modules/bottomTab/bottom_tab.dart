import 'package:DungxApp/modules/booking/booking.dart';
import 'package:DungxApp/modules/favourite/favourite.dart';
import 'package:DungxApp/modules/home/home_page.dart';
import 'package:DungxApp/modules/mailbox/mailbox.dart';
import 'package:DungxApp/modules/setting/setting.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';

class BottomTab extends StatefulWidget {
  const BottomTab({Key? key}) : super(key: key);

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int currentIndex = 0;
  final screens = [Home(), Favourite(), Booking(), Mailbox(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedItemColor: AppColors.primary,
        mouseCursor: null,
        iconSize: 20,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(AppIcon.ic_home),
            label: 'Home',
            activeIcon: Icon(AppIcon.ic_home_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.ic_favourite),
            label: 'Favourites',
            activeIcon: Icon(AppIcon.ic_favourite_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.ic_booking),
            label: 'My Booking',
            activeIcon: Icon(AppIcon.ic_booking_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.ic_mailbox),
            label: 'Mail Box',
            activeIcon: Icon(AppIcon.ic_mailbox_active),
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcon.ic_setting),
            label: 'Setting',
            activeIcon: Icon(AppIcon.ic_setting_active),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
