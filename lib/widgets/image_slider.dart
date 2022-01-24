import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  final String url;
  final String nameSpace;
  const ImageSlider({Key? key, required this.url, required this.nameSpace})
      : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              image: DecorationImage(
                  image: NetworkImage(
                    widget.url,
                  ),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                widget.nameSpace,
                style: const TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
