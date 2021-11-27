// @dart=2.9

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:blnk_demo/pages/login/viewModel/logn_view_model.dart';
import 'package:blnk_demo/pages/register/model/register_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:http/http.dart'as http;

import 'google_auth_client.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signin;

class RegisterViewModel extends GetxController/* with GetResponse*/{
  String firstName = "";
  String lastName = "";
  String address = "";
  String dropdownValue = 'choose area';
  String landline = "";
  String phoneNumber = "";
  Uint8List firstList;
  File image;


// Google App Script Web URL.
  static const String URL = "https://script.google.com/macros/s/AKfycbyymVpoQLh3UZ_mP-_GABDJLB1OK--jgDYVkUzWox97ZmZnAfDFUEZn3J2k_YvYHFjYVg/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(FeedbackForm feedbackForm, void Function(String ) callback) async {
    try {
      await http.post(Uri.parse(URL), body: feedbackForm.toJson()).then((response) async {


        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url)).then((response) {
            callback(jsonDecode(response.body)['status']);
          });
        } else {
          callback(jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }


  uploadImages()async{
    final response = await http.post(Uri.parse(
        'https://www.googleapis.com/upload/drive/v3/files?uploadType=media'),
        headers: {
          //'Content-Type': 'application/json',
          //'Accept': 'application/json',
        },
        body: image
    );


  }
}