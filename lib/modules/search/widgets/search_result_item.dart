import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:flutter/material.dart';

class SearchResultItem extends StatefulWidget {
  const SearchResultItem({Key? key}) : super(key: key);

  @override
  _SearchResultItemState createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: Constants(context).width - 40,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://odinland.com/wp-content/uploads/2021/03/enouvo-space-an-nhon-5.jpg',
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          ),
          SizedBox(height: 16),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Enouvo Space 1',
                          style: Theme.of(context).textTheme.headline3),
                      Text('10 - 12 VND',
                          style: Theme.of(context).textTheme.headline4),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: const [
                      Text('2.4 km',
                          style: TextStyle(
                              fontSize: 12, color: AppColors.primary)),
                      SizedBox(width: 8),
                      Text('15 Tạ Mỹ Duật, Sơn Trà, Đà Nẵng',
                          style:
                              TextStyle(fontSize: 12, color: AppColors.mainL2)),
                    ],
                  ),
                ],
              )),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
