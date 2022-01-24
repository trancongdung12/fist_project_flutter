import 'package:DungxApp/api/home_responsitory.dart';
import 'package:DungxApp/models/response/banner_response.dart';
import 'package:DungxApp/models/response/events_response.dart';
import 'package:DungxApp/models/response/locations_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});
  var banner = BannerResponse(results: [], total: 0).obs();
  var nearBy = LocationsResponse(results: [], total: 0).obs();
  var events = EventsResponse(results: [], total: 0).obs();
  final isLoadingBanner = false.obs;
  final isLoadingNearBy = false.obs;
  final isLoadingEvent = false.obs;

  @override
  void onInit() {
    getBanners();
    getNearBy();
    getEvents();
    super.onInit();
  }

  void getBanners() async {
    try {
      isLoadingBanner.value = true;
      final res = await homeRepository.getBanner();
      if (res != null) {
        banner = res;
      }
    } finally {
      isLoadingBanner.value = false;
      update();
    }
  }

  void getNearBy() async {
    try {
      isLoadingNearBy.value = true;
      final res = await homeRepository.getLocations();
      if (res != null) {
        nearBy = res;
      }
    } finally {
      isLoadingNearBy.value = false;
      update();
    }
  }

  void getEvents() async {
    try {
      isLoadingEvent.value = true;
      final res = await homeRepository.getEvents();
      if (res != null) {
        events = res;
      }
    } finally {
      isLoadingEvent.value = false;
      update();
    }
  }
}
