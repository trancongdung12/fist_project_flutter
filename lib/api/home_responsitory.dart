import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/banner_response.dart';
import 'package:DungxApp/models/response/events_response.dart';
import 'package:DungxApp/models/response/location_response.dart';
import 'package:DungxApp/models/response/locations_response.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
    var response = await http.get(Uri.parse(Api.baseUrl + locationUrl));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return LocationsResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Locations Fail");
    }
  }

  Future<LocationResponse?> getLocation({
    required String locationId,
  }) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    String locationUrl = 'mobile/locations/$locationId';
    var response =
        await http.get(Uri.parse(Api.baseUrl + locationUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return LocationResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Location Fail");
    }
  }

  Future<EventsResponse?> getEvents() async {
    var response = await http.get(Uri.parse(Api.eventsApi));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return EventsResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Events Fail");
    }
  }
}
