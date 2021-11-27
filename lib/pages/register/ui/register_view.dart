// @dart=2.9

import 'package:blnk_demo/pages/custom_widget/custom_button.dart';
import 'package:blnk_demo/pages/custom_widget/custom_text_form_filed.dart';
import 'package:blnk_demo/pages/register/ui/second_register_view.dart';
import 'package:blnk_demo/pages/register/viewModel/register_view_model.dart';
import 'package:blnk_demo/utils/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String dropdownValue = 'Cairo';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterViewModel>(
        init: Get.find<RegisterViewModel>(),
        builder: (controller) => Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        const Text(
                          "Pls Enter your Info",
                          style: TextStyle(
                              color: Colors.orange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        CustomTextFormField(
                          text: "",
                          onSaved: (value) {
                            controller.firstName = value;
                          },
                          // onChanged: (value) {
                          //   //newPass = value;
                          // },
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "Pls enter your first name";
                            } else if (InputValidators().nameValidator(
                                name: value, context: context)) {
                              return null;
                            } else {
                              return "Invalid name";
                            }
                          },
                          hint: "First Name",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        CustomTextFormField(
                          text: "",
                          onSaved: (value) {
                            controller.lastName = value;
                          },
                          // onChanged: (value) {
                          //   //confirmPass = value;
                          // },
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "Pls enter your last name";
                            } else if (InputValidators().nameValidator(
                                name: value, context: context)) {
                              return null;
                            } else {
                              return "Invalid name";
                            }
                          },
                          hint: "Last Name",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        CustomTextFormField(
                          text: "",
                          onSaved: (value) {
                            controller.address = value;
                          },
                          // onChanged: (value) {
                          //   //confirmPass = value;
                          // },
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "Pls enter your address";
                            } else if (value.length >= 5 ) {
                              return null;
                            } else {
                              return "pls enter at least 5 characters";
                            }
                          },
                          hint: "Address",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .035,
                        ),
                        SizedBox(
                          //color: Colors.grey.shade200,
                          width: MediaQuery.of(context).size.width,
                          child: DropdownButton<String>(
                            hint: SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  .75, //and here
                              child: const Text(
                                "",
                                style: TextStyle(color: Colors.black),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            underline: Container(
                              height: 1,
                              color: Colors.grey.shade600,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['Cairo', 'Alex', 'Aswan', 'Tanta']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        CustomTextFormField(
                          text: "",
                          onSaved: (value) {
                            controller.landline = value;
                          },
                          // onChanged: (value) {
                          //   //confirmPass = value;
                          // },
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "Pls enter your landline";
                            } else if (value.length >= 8) {
                              return null;
                            } else {
                              return "pls enter at least 8 numbers";
                            }
                          },
                          hint: "Landline",
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .025,
                        ),
                        CustomTextFormField(
                          text: "",
                          onSaved: (value) {
                            controller.phoneNumber = value;
                          },
                          // onChanged: (value) {
                          //   //confirmPass = value;
                          // },
                          validator: (value) {
                            if (value.isEmpty || value == null) {
                              return "Pls enter your phone number";
                            } else if (InputValidators().phoneNumberValidator(
                                phoneNumber: value, context: context)) {
                              return null;
                            } else {
                              return "invalid phone number";
                            }
                          },
                          hint: "Phone Number",
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        CustomButton(
                          text: "Continue",
                          onPress: ()async{
                            _formKey.currentState.save();
                            if(_formKey.currentState.validate()){
                              controller.dropdownValue = dropdownValue;
                              Get.to(()=> SecondRegisterView());
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
