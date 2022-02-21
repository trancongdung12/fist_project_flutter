import 'package:DungxApp/models/response/booking_response.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';

class BookingItem extends StatefulWidget {
  final Result booking;
  const BookingItem({Key? key, required this.booking}) : super(key: key);

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
              Text(
                '#${widget.booking.code}',
                style: const TextStyle(fontSize: 12),
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
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.booking.location.thumbnail,
                        ),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 7, top: 4),
                      child: Text(
                        widget.booking.location.name,
                        style: const TextStyle(
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
                        Text(
                          '${widget.booking.actualAmount} VND',
                          style: const TextStyle(
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
                            Text(
                              widget.booking.status,
                              style: const TextStyle(
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
