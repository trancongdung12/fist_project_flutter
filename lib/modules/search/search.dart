import 'dart:async';

import 'package:DungxApp/routes/app_pages.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String textSearch = '';
  var addressResult = [];
  @override
  void initState() {
    super.initState();
  }

  Timer? _debounce;

  void _onSearchChanged(String textQuery) {
    String GOOGLE_MAPS_API_KEY = '';
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      final urlPlaces =
          'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$textQuery&radius=15000&key=$GOOGLE_MAPS_API_KEY';
      var response = await http.get(Uri.parse(urlPlaces));
      var data = jsonDecode(response.body);

      setState(() {
        addressResult = data['results'];
      });
    });
  }

  void _onSearch() {
    Get.toNamed(Routes.SEARCH_RESULT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: Constants(context).width - 100,
                height: 40,
                child: TextField(
                  onChanged: _onSearchChanged,
                  style: const TextStyle(fontSize: 14, color: AppColors.mainL1),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      AppIcon.ic_search,
                      color: AppColors.mainL3,
                      size: 20,
                    ),
                    hintStyle: TextStyle(fontSize: 14, color: AppColors.mainL3),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    hintText: 'Search address or space name',
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                  splashColor: Colors.white,
                  onTap: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.mainL1, fontSize: 14),
                  )),
            ],
          ),
          SizedBox(
            child: addressResult.isNotEmpty
                ? const SizedBox.shrink()
                : TextButton.icon(
                    onPressed: _onSearch,
                    icon: const Icon(AppIcon.ic_location,
                        color: AppColors.primary, size: 20),
                    label: const Text(
                      'Use my current location',
                      style: TextStyle(color: AppColors.primary),
                    )),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: addressResult.length,
              itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.white,
                  onTap: _onSearch,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8, top: 8),
                    child: Row(
                      children: [
                        const Icon(
                          AppIcon.ic_location,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Constants(context).width - 70,
                              child: Text(addressResult[index]['name'],
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: Constants(context).width - 70,
                              child: Text(
                                  addressResult[index]['formatted_address'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColors.mainL3)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    )));
  }
}
