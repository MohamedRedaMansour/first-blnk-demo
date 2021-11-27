import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppSharedPref {
  //static const String KEY_IS_FIRST_TIME = "firstTime";
  static const String KEY_STAFF_NAME = "Name";
  static const String KEY_STAFF_EMAIL = "Email";
  static const String KEY_STAFF_SERVER_CODE = "Token";
  static const String KEY_STAFF_PHOTO = "Avatar";
  static const String KEY_STAFF_ID = "Id";

  static setString(String key, String value) async {
    final sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(key) == null ? "" : sp.getString(key);
  }

  static setBool(String key, bool value) async {
    final sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getBool(key) == null ? false : sp.getBool(key);
  }

  // static logOutUser() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   await preferences.clear();
  //   AppSharedPref.setBool(AppSharedPref.KEY_IS_LOGIN, false);
  //   AppSharedPref.setString(AppSharedPref.KEY_STAFF_NAME, "");
  //   AppSharedPref.setString(AppSharedPref.KEY_STAFF_EMAIL, "");
  //   AppSharedPref.setString(AppSharedPref.KEY_STAFF_TOKEN, "");
  //   AppSharedPref.setString(AppSharedPref.KEY_STAFF_AVATAR, "");
  //   AppSharedPref.setBool(AppSharedPref.KEY_SEEN, true);
  //   Get.offAll(() => LoginUI(), binding: Binding());
  // }

}
