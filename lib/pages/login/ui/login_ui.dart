// @dart=2.9

import 'package:blnk_demo/pages/login/viewModel/logn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginUI extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginViewModel>(
        init: Get.find<LoginViewModel>(),
        builder: (controller) =>
      Scaffold(
      body: Center(
        child: Column(
          children: [
             SizedBox(height: MediaQuery.of(context).size.height *.3),
            const Text(
              "Google Sign In",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *.03),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "In order to use our service  \n you have to sign in first",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height *.2),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: MediaQuery.of(context).size.height * .07,
              child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.orange),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.orange)))),
                  onPressed: () async {
                    await controller.signIn();
                  },
                  child: const Text(
                    "Sign In with Google",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        )
      ),
    ));
  }
}
