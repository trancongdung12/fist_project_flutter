import 'package:DungxApp/models/response/events_response.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsItem extends StatefulWidget {
  final Result event;
  const NewsItem({Key? key, required this.event}) : super(key: key);

  @override
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.3,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 96,
            width: 96,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6), topRight: Radius.circular(6)),
                image: DecorationImage(
                    image: NetworkImage(
                      widget.event.thumbnail,
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width - 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.event.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.event.location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 6),
                Text(
                    DateFormat('dd/MM/yyyy, HH:mm')
                        .format(widget.event.eventTime),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primary,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
