import 'package:DungxApp/api/home_responsitory.dart';
import 'package:get/get.dart';

class SpaceDetailController extends GetxController {
  final HomeRepository homeRepository;
  SpaceDetailController({required this.homeRepository});

  var location = Rxn();
  final isLoading = false.obs;
  var locationId = Get.arguments;

  @override
  void onInit() {
    getLocation(locationId);
    super.onInit();
  }

  void getLocation(String locationId) async {
    try {
      isLoading.value = true;
      final res = await homeRepository.getLocation(
        locationId: locationId,
      );
      if (res != null) {
        location.value = res;
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
