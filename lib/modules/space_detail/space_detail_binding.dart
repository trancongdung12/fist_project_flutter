import 'package:DungxApp/api/home_responsitory.dart';
import 'package:DungxApp/modules/space_detail/space_detail_controller.dart';
import 'package:get/get.dart';

class SpaceDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SpaceDetailController>(
      SpaceDetailController(
        homeRepository: HomeRepository(),
      ),
    );
  }
}
