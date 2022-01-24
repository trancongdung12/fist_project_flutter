import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';

class RowText extends StatefulWidget {
  final String title;
  final Function onPress;
  const RowText({Key? key, required this.title, required this.onPress})
      : super(key: key);

  @override
  _RowTextState createState() => _RowTextState();
}

class _RowTextState extends State<RowText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onPress();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title),
              const Icon(AppIcon.ic_arrow_next, size: 20)
            ],
          ),
        ));
  }
}
