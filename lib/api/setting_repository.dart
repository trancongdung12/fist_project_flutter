import 'package:DungxApp/api/api.dart';
import 'package:DungxApp/models/response/banner_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SettingRepository {
  SettingRepository();

  Future<BannerResponse?> getBanner() async {
    var response = await http.get(Uri.parse(Api.bannerApi));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      print('object' + body);
    } else {
      Get.snackbar("Error", "Get Banner Fail");
    }
  }
}
