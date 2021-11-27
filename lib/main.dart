// @dart=2.9

import 'dart:async';
import 'package:blnk_demo/pages/login/ui/login_ui.dart';
import 'package:blnk_demo/pages/register/ui/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/cache/app_shared_pref.dart';
import 'di/binding.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
        home:  Scaffold(
          body: SplashScreen(),
        ));
  }
}

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future validateUser() async {

      AppSharedPref.getString(AppSharedPref.KEY_STAFF_ID).then((value) {
        print("ID is $value");
        if (value == "" || value == null) {
          Get.offAll(() => LoginUI(), binding: Binding());
        } else {
          Get.offAll(() => RegisterView(), binding: Binding());
        }
      });

  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      await validateUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/splash.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

