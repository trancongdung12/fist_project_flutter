import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/banner_response.dart';
import 'package:DungxApp/models/response/events_response.dart';
import 'package:DungxApp/models/response/locations_response.dart';
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

  Future<LocationsResponse?> getLocations() async {
    var response = await http.get(Uri.parse(Api.locationsApi));
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
