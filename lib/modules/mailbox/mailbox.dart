import 'package:DungxApp/modules/mailbox/widgets/header_item.dart';
import 'package:DungxApp/modules/mailbox/widgets/inbox_item.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';

class Mailbox extends StatefulWidget {
  const Mailbox({Key? key}) : super(key: key);

  @override
  _MailboxState createState() => _MailboxState();
}

class _MailboxState extends State<Mailbox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mail Box', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          elevation: 0.5,
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
