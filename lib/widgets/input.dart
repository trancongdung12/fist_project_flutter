import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final String title;
  const Input({Key? key, required this.title}) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: const TextStyle(
          fontSize: 14,
        ),
        // onChanged: (email) {}
        // keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10.0),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            hintText: widget.title),
      ),
    );
  }
}
