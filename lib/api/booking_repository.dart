import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/booking_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingRepository {
  BookingRepository();

  Future<BookingsResponse?> getBookings() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    var response = await http.get(Uri.parse(Api.bookingsApi), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BookingsResponse.fromJson(body);
    } else {
      Get.snackbar("Error", "Get Booking Fail");
    }
  }
}
