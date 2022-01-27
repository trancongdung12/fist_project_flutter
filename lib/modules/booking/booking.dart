import 'package:DungxApp/modules/booking/widgets/booking_item.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('My bookings', style: Theme.of(context).textTheme.headline3),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.3,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => const BookingItem()),
            )
          ],
        ));
  }
}
