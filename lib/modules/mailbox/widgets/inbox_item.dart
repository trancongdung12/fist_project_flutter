import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:DungxApp/modules/mailbox/pages/inbox.dart';

class InboxItem extends StatefulWidget {
  const InboxItem({Key? key}) : super(key: key);

  @override
  _InboxItemState createState() => _InboxItemState();
}

class _InboxItemState extends State<InboxItem> {
  goToInbox() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Inbox()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          goToInbox();
        },
        child: Container(
            color: Theme.of(context).backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(children: [
              SizedBox(
                child: Stack(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: NetworkImage(
                                'https://odinland.com/wp-content/uploads/2021/03/enouvo-space-an-nhon-5.jpg',
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(56 / 2)),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Constants(context).width - 116,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Enouvo Space 1',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]),
                          ),
                          Text('17:22',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  color: Colors.grey[700]))
                        ]),
                  ),
                  const SizedBox(height: 4),
                  const Text('Incident Report',
                      style: TextStyle(color: AppColors.primary)),
                  const SizedBox(height: 4),
                  const Text('Hello Jason, we would appicia...')
                ],
              )
            ])));
  }
}
