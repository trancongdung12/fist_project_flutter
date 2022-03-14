import 'package:DungxApp/themes/app_color.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Function onPress;
  final String title;
  final double? width;
  const Button(
      {Key? key, required this.title, required this.onPress, this.width})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: widget.width ?? MediaQuery.of(context).size.width,
      child: SizedBox(
          child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primary),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                widget.onPress();
              },
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.black),
              ))),
    );
  }
}
