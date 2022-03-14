import 'package:DungxApp/api/booking_repository.dart';
import 'package:DungxApp/models/response/booking_response.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  final BookingRepository bookingRepository;
  BookingController({required this.bookingRepository});

  final isLoading = false.obs;
  final bookings = <Result>[].obs;
  final currentPage = 1.obs;
  final totalItems = 0.obs;

  @override
  void onInit() {
    ever(currentPage, (_) => getBookings());
    currentPage.value = 1;
    super.onInit();
  }

  void getBookings() async {
    try {
      isLoading.value = true;
      final res = await bookingRepository.getBookings(page: currentPage.value);
      if (res?.results != null) {
        bookings.addAll(res!.results);
        totalItems.value = res.total;
      }
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void loadMore() {
    if (bookings.length < totalItems.value) {
      currentPage.value++;
    }
  }

  Future<void> onRefresh() async {
    print('call refersh');
    // bookings.value = [];
    // currentPage.value = 0;
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  void onClose() {
    super.onClose();
  }
}
