import 'package:DungxApp/themes/app_color.dart';
import 'package:flutter/material.dart';

class HeaderItem extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  const HeaderItem(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon})
      : super(key: key);

  @override
  _HeaderItemState createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(56 / 2)),
                child: Icon(
                  widget.icon,
                  size: 28,
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Text(widget.description,
                      style: TextStyle(color: Colors.grey[600]))
                ],
              )
            ],
          ),
        ),
        Divider(
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
