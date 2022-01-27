import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';

class PinItem extends StatefulWidget {
  const PinItem({Key? key}) : super(key: key);

  @override
  _PinItemState createState() => _PinItemState();
}

class _PinItemState extends State<PinItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 145,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    image: DecorationImage(
                        image: NetworkImage(
                          'https://odinland.com/wp-content/uploads/2021/03/enouvo-space-an-nhon-5.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 16, top: 13),
                  child: const Text(
                    'Enouvo Space 1',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 6, bottom: 16, left: 16),
                child: const Text(
                  '2.4 km - 16 An Hải Bắc, Sơn Trà, Đà Nẵng',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Positioned(
              top: 16,
              left: 16,
              child: SizedBox(
                width: Constants(context).width - 74,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text(
                        '4.8',
                        style:
                            TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey[700]?.withOpacity(0.7)),
                          child: const Icon(
                            AppIcon.ic_price,
                            color: AppColors.primary,
                            size: 18,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey[700]?.withOpacity(0.7)),
                          child: const Icon(
                            AppIcon.ic_favourite,
                            color: AppColors.primary,
                            size: 22,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
