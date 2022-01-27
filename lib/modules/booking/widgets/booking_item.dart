import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';

class BookingItem extends StatefulWidget {
  const BookingItem({Key? key}) : super(key: key);

  @override
  _BookingItemState createState() => _BookingItemState();
}

class _BookingItemState extends State<BookingItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: Constants(context).width - 40,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.3,
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).backgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '#SI0724589',
                style: TextStyle(fontSize: 12),
              ),
              Text(
                '22/01/2021, 08:00',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 86,
                width: 86,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: const DecorationImage(
                        image: NetworkImage(
                          'https://odinland.com/wp-content/uploads/2021/03/enouvo-space-an-nhon-5.jpg',
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 7, top: 4),
                      child: const Text(
                        'Enouvo Space 1',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      )),
                  const Text(
                    'Hot desk monthly',
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    '23/12/2021 - 23/12/2021',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  SizedBox(
                    width: Constants(context).width - 160,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '100.000 VND',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 4),
                              height: 6,
                              width: 6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.purple),
                            ),
                            const Text(
                              'UNCONFIRMED',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.grey[100],
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: AppColors.primary,
                ),
                onPressed: () {},
                child: const Text(
                  'Book Again',
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )),
          )
        ],
      ),
    );
  }
}
