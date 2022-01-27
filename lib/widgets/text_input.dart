import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextInput extends StatefulWidget {
  double? mTop;
  double? mBottom;
  TextInputType? keyboardType = TextInputType.none;
  String? labelText;
  int? maxLines;
  ValueChanged<String>? onChanged;
  String? errorText;
  FormFieldValidator<String>? validator;
  String? hintText;
  bool? enableSuggestions = false;
  double? borderRadius;
  bool obscureText = false;
  final TextEditingController? controller;

  TextInput({
    Key? key,
    this.mTop,
    this.mBottom,
    this.labelText,
    required this.obscureText,
    this.keyboardType,
    this.errorText,
    this.validator,
    this.hintText,
    this.maxLines,
    this.enableSuggestions,
    this.borderRadius,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  State<TextInput> createState() {
    return _TextInputState();
  }
}

// ignore: must_be_immutable
class _TextInputState extends State<TextInput> {
  bool isSecure = false;

  @override
  void initState() {
    isSecure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            bottom: widget.mBottom ?? 16, top: widget.mTop ?? 0),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          controller: widget.controller,
          obscureText: isSecure ? widget.obscureText : isSecure,
          enableSuggestions: widget.enableSuggestions ?? false,
          autocorrect: false,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isSecure = !isSecure;
                      });
                    },
                    iconSize: 20,
                    color: Colors.black,
                    icon: Icon(
                      isSecure ? AppIcon.ic_eye_close : AppIcon.ic_eye,
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            errorText: widget.errorText,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
          ),
        ));
  }
}
