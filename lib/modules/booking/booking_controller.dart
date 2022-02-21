import 'package:DungxApp/api/booking_repository.dart';
import 'package:DungxApp/models/response/booking_response.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final BookingRepository bookingRepository;
  BookingController({required this.bookingRepository});

  var bookings = BookingsResponse(results: [], total: 0).obs();
  final isLoading = false.obs;

  @override
  void onInit() {
    getBookings();
    super.onInit();
  }

  void getBookings() async {
    try {
      isLoading.value = true;
      final res = await bookingRepository.getBookings();
      if (res != null) {
        bookings = res;
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
