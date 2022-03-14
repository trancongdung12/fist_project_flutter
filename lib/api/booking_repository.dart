import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/booking_response.dart';
import 'package:DungxApp/utils/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingRepository {
  BookingRepository();

  Future<BookingsResponse?> getBookings(
      {required int page, int limit = StorageConstants.limit}) async {
    print(page);
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    String bookingUrl =
        'mobile/bookings/me?offset=${page * limit}&limit=$limit';

    var response =
        await http.get(Uri.parse(Api.baseUrl + bookingUrl), headers: {
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
