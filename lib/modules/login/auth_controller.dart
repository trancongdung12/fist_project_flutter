import 'package:DungxApp/api/auth_repository.dart';
import 'package:DungxApp/models/request/login_request.dart';
import 'package:DungxApp/routes/app_pages.dart';
import 'package:DungxApp/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  var user = Rxn();

  @override
  void onInit() {
    checkLogin();
    // loadUser();
    super.onInit();
  }

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final loginEmailController =
      TextEditingController(text: "tan.nguyen@team.enouvo.com");
  final loginPasswordController = TextEditingController(text: "123456");

  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  final emailResetController = TextEditingController();

  void login(BuildContext context) async {
    if (loginFormKey.currentState!.validate()) {
      final res = await authRepository.login(
        LoginRequest(
          email: loginEmailController.text,
          password: loginPasswordController.text,
        ),
      );
      if (res!.token.isNotEmpty) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString('token', res.token);
        Get.offNamedUntil(Routes.BOTTOM_TAB, (route) => false);
      }
    }
  }

  validateEmail(value, text) {
    if (value!.isEmpty && text.isEmpty) {
      return 'Email is required.';
    } else if (!Regex.isEmail(text)) {
      return 'Email format error.';
    }
    return null;
  }

  validatePassword(value, text) {
    if (value!.isEmpty && text.isEmpty) {
      return 'Password is required.';
    } else if (text.length < 6 || text.length > 15) {
      return 'Password should be 6~15 characters';
    }
    return null;
  }

  void checkLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString('token');
    if (token != null) {
      Get.offNamedUntil(Routes.BOTTOM_TAB, (route) => false);
    }
  }

  // Future<void> loadUser() async {
  //   final QueryResult result = await authRepository.getUser();
  //   if (result.data != null) {
  //     user.value = null;
  //   }
  // }

  @override
  void onClose() {
    super.onClose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
  }
}
