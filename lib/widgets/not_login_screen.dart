import 'package:DungxApp/widgets/button.dart';
import 'package:flutter/material.dart';

class NotLoginScreen extends StatefulWidget {
  final String image;
  final String title;
  final String desc;
  final String note;
  const NotLoginScreen(
      {Key? key,
      required this.image,
      required this.title,
      required this.desc,
      required this.note})
      : super(key: key);

  @override
  _NotLoginScreenState createState() => _NotLoginScreenState();
}

class _NotLoginScreenState extends State<NotLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, bottom: 20),
            constraints: const BoxConstraints.expand(height: 200, width: 200),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.image), fit: BoxFit.contain)),
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          Text(
            widget.desc,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 20),
          Text(
            widget.note,
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Button(title: 'Login', onPress: () {}),
          )
        ],
      ),
    );
  }
}
