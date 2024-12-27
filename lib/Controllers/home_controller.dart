// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  RxBool isLoader = false.obs;
  RxString userId = "".obs;
  RxString userName = "".obs;
  RxString userMobileNumber = "".obs;

  @override
  void onInit() {
    isLoader.value = true;
    getUserInfo();
    isLoader.value = false;
    super.onInit();
  }

  getUserInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userId.value = pref.getString("userId") ?? "";
    userName.value = pref.getString("userName") ?? "";
    userMobileNumber.value = pref.getString("userMobileNumber") ?? "";
    print(userId.toString());
    print(userName.toString());
    print(userMobileNumber.toString());
  }
}
