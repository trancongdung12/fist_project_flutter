import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class BottomWidget extends StatefulWidget {
  final Function handleSendPressed;
  const BottomWidget({Key? key, required this.handleSendPressed})
      : super(key: key);

  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  String textMessage = '';
  void sendMessage() {
    final message = types.PartialText(text: textMessage);
    widget.handleSendPressed(message);
  }

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Icon(AppIcon.ic_plus_1, size: 20, color: AppColors.primary),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Icon(AppIcon.ic_image,
                      size: 20, color: AppColors.primary)),
              Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Icon(AppIcon.ic_files,
                      size: 20, color: AppColors.primary)),
              Flexible(
                  child: Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Colors.indigo,
                  onChanged: (text) {
                    setState(() {
                      textMessage = text;
                    });
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: 'Aa'),
                ),
              )),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: InkWell(
                    onTap: () {
                      sendMessage();
                      _controller.clear();
                    },
                    child: const Icon(AppIcon.ic_send,
                        size: 20, color: AppColors.primary)),
              )
            ],
          )),
    );
  }
}
