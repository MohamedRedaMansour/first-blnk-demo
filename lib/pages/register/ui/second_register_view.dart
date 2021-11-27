// @dart=2.9

import 'dart:convert';
import 'dart:io';
import 'package:blnk_demo/pages/custom_widget/custom_button.dart';
import 'package:blnk_demo/pages/register/model/register_request.dart';
import 'package:blnk_demo/pages/register/viewModel/register_view_model.dart';
import 'package:blnk_demo/pages/success_page/success_page.dart';
import 'package:blnk_demo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';


class SecondRegisterView extends StatefulWidget {

  @override
  _SecondRegisterViewState createState() => _SecondRegisterViewState();
}

class _SecondRegisterViewState extends State<SecondRegisterView> {

  RegisterViewModel registerViewModel = Get.find<RegisterViewModel>();


  File _image, _image1, _image2;
  String firstImage = "";
  String secondImage = "";
  String firsImageName = "";
  String secondImageName = "";
  String imgName = "";


  var _imageBytes;
  Future<String> getImage() async {
    String imgBase = "";
    String imgExtension = "";
    final pickedFile = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 20);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _imageBytes = _image.readAsBytesSync();
        imgBase = base64Encode(_imageBytes);
        imgExtension = "image/" + _image.path.split('.').last;
        imgName = _image.path.split('/').last;
      } else {
        print('No image selected.');
      }
      print(_image == null ? "xx" : "image isn't null ");
      print("_imgBase64 :" + imgBase);
      print("_imgExtension : " + imgExtension);
      print("img Name: " + imgName);
    });
    return imgBase;
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterViewModel>(
        init: registerViewModel,
    builder: (controller) =>
      Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Center(
            child: Column(
              children:   [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                 const Text(
                  "Almost complete ...",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                const Text(
                  "Upload the front of your national ID",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () async {
                    firstImage = await getImage();
                    _image1 = _image;
                    firsImageName = imgName ;
                    //registerViewModel.firstList = _imageBytes;
                    print("first ----------------"+firsImageName);                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: MediaQuery.of(context).size.height * .2,
                      width:
                      MediaQuery.of(context).size.width * .25,
                      child: CircleAvatar(
                        child: _image1 == null
                            ? const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        )
                            : null,
                        backgroundColor: Colors.amber,
                        backgroundImage: _image1 == null
                            ? null
                            : FileImage(_image1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                const Text(
                  "Upload the back of your national ID",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () async {
                    secondImage = await getImage();
                    _image2 = _image;
                    secondImageName = imgName;
                    //registerViewModel.secondList = _imageBytes;
                    print("two----------------"+secondImageName);
                  },
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      height: MediaQuery.of(context).size.height * .2,
                      width:
                      MediaQuery.of(context).size.width * .25,
                      child: CircleAvatar(
                        child: _image2 == null
                            ? const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        )
                            : null,
                        backgroundColor: Colors.amber,
                        backgroundImage: _image2 == null
                            ? null
                            : FileImage(_image2),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                CustomButton(
                  text: "Continue",
                  onPress: () async{
                    _submitForm();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if(firstImage.isNotEmpty && secondImage.isNotEmpty){
      FeedbackForm feedbackForm = FeedbackForm(
          registerViewModel.firstName,
          registerViewModel.lastName,
          registerViewModel.address,
          registerViewModel.dropdownValue,
          registerViewModel.landline,
          registerViewModel.phoneNumber,
          firsImageName,
          secondImageName,
      );

      //_showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      registerViewModel.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == RegisterViewModel.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          //_showSnackbar("Feedback Submitted");
          Get.to(()=> const SuccessPage());
        } else {
          // Error Occurred while saving data in Google Sheets.
          Utils.showToastNotification("error pls try again");

        }
      });
    }else{
      Utils.showToastNotification("Pls upload two images");
    }
  }



}
