import 'dart:async';

import 'package:DungxApp/modules/search/widgets/search_result_item.dart';
import 'package:DungxApp/themes/app_color.dart';
import 'package:DungxApp/themes/app_constant.dart';
import 'package:DungxApp/themes/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(16.060337080815582, 108.23870302604293),
      zoom: 20,
    );

    final CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(AppIcon.ic_filter),
            onPressed: () {},
          )
        ],
        title:
            Text('Search result', style: Theme.of(context).textTheme.headline3),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.3,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: AppColors.primary,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'List view',
                  ),
                  Tab(
                    text: 'Map view',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return SearchResultItem();
                    },
                  ),
                  GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
