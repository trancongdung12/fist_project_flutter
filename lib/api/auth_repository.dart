import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/request/login_request.dart';
import 'package:DungxApp/models/response/login_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  AuthRepository();

  Future<LoginResponse?> login(LoginRequest data) async {
    if (data.email.isNotEmpty && data.password.isNotEmpty) {
      var response = await http.post(Uri.parse(Api.loginApi),
          body: ({
            "email": data.email,
            "password": data.password,
          }));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return LoginResponse.fromJson({'token': body['token']});
      } else {
        Get.snackbar("Error", "Login fail");
      }
    }
  }
}
