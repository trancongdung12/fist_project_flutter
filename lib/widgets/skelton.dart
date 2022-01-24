import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelton extends StatelessWidget {
  final double? height, width, mTop, mBottom, mLeft, mRight;
  const Skelton(
      {Key? key,
      this.height,
      this.width,
      this.mTop,
      this.mBottom,
      this.mLeft,
      this.mRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child: Container(
          height: height,
          width: width,
          margin: EdgeInsets.fromLTRB(
              mLeft ?? 0, mTop ?? 0, mRight ?? 0, mBottom ?? 0),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
        ));
  }
}
