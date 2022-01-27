import 'package:DungxApp/modules/mailbox/mailbox_controller.dart';
import 'package:DungxApp/modules/mailbox/widgets/header_item.dart';
import 'package:DungxApp/modules/mailbox/widgets/inbox_item.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mailbox extends GetView<MailBoxController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mailbox', style: Theme.of(context).textTheme.headline3),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.3,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: const [
                          HeaderItem(
                            title: 'Notifications',
                            description: 'Manage your notifications',
                            icon: AppIcon.ic_notification,
                          ),
                          HeaderItem(
                            title: 'Incident Report',
                            description: 'Manage your incident reports',
                            icon: AppIcon.ic_incident_report,
                          ),
                        ],
                      );
                    } else {
                      return const InboxItem();
                    }
                  }),
            )
          ],
        ));
  }
}
