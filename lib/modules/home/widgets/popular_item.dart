import 'package:DungxApp/models/response/locations_response.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:flutter/material.dart';

class PopularItem extends StatefulWidget {
  final Result location;
  final Function onPress;
  const PopularItem({Key? key, required this.location, required this.onPress})
      : super(key: key);

  @override
  _PopularItemState createState() => _PopularItemState();
}

class _PopularItemState extends State<PopularItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onPress(widget.location.id);
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: (Constants(context).width - 55) / 2,
            height: 140,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.09),
                  spreadRadius: 0.3,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    height: 83,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)),
                        image: DecorationImage(
                            image: NetworkImage(
                              widget.location.thumbnail ??
                                  StorageConstants.defaultLogo,
                            ),
                            fit: BoxFit.contain)),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 7, top: 8),
                      child: Text(
                        widget.location.name ?? 'N/A',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 4, bottom: 14, left: 8),
                    child: Text(
                      widget.location.address,
                      maxLines: 1,
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ]),
                Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 18,
                      width: 18,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        widget.location.rating.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 8, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            )));
  }
}
