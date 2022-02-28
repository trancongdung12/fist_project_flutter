import 'dart:developer';

import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/banner_response.dart';
import 'package:DungxApp/models/response/events_response.dart';
import 'package:DungxApp/models/response/locations_response.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepository {
  HomeRepository();

  Future<BannerResponse?> getBanner() async {
    var response = await http.get(Uri.parse(Api.bannerApi));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BannerResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Banner Fail");
    }
  }

  Future<LocationsResponse?> getLocations({
    required int page,
    latitude,
    longitude,
    userLatitude,
    userLongitude,
    int limit = StorageConstants.limit,
    int distance = StorageConstants.distance,
  }) async {
    String locationUrl = 'mobile/locations?offset=${page * limit}&limit=$limit';
    if (latitude != null && longitude != null) {
      locationUrl +=
          '&geoLocation={"longitude": $longitude, "latitude": $latitude}&distance=$distance';
    }

    if (userLatitude != null && userLongitude != null) {
      locationUrl +=
          '&userGeoLocation={"longitude": $userLongitude, "latitude": $userLatitude}';
    }
    print(Api.baseUrl + locationUrl);
    var response = await http.get(Uri.parse(Api.baseUrl + locationUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return LocationsResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Locations Fail");
    }
  }

  Future<EventsResponse?> getEvents() async {
    var response = await http.get(Uri.parse(Api.eventsApi));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return EventsResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Locations Fail");
    }
  }
}
