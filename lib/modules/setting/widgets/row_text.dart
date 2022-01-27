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
      child: Container(
          decoration: BoxDecoration(
            border: const Border(
              bottom: BorderSide(width: 0.3, color: Colors.black12),
            ),
            color: Theme.of(context).backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const Icon(AppIcon.ic_arrow_next, size: 20)
              ],
            ),
          )),
    );
  }
}
