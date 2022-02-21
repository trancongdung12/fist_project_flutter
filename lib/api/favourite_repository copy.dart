import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/booking_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class FavouriteRepository {
  FavouriteRepository();

  Future<BookingsResponse?> getBookings() async {
    print('run');
    var response = await http.get(Uri.parse(Api.bookingsApi));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('object' + body);
    } else {
      Get.snackbar("Error", "Get Booking Fail");
    }
  }
}
