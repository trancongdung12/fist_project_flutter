import 'package:DungxApp/api/auth_repository.dart';
import 'package:DungxApp/modules/login/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
        () => AuthController(authRepository: Get.put(AuthRepository())));
  }
}
