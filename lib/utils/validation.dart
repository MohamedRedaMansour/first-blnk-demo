import 'package:blnk_demo/pages/custom_widget/error_dialog.dart';
import 'package:flutter/material.dart';

class InputValidators {
  bool emailValidator({String? email, required BuildContext context}) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp _regExp = RegExp(pattern);

    if (email == null || email.isEmpty) {
      // showErrorDialog(
      //   context: context,
      //   errorMessage: 'Please fill the Email',
      // );
      return false;
    } else if (!_regExp.hasMatch(email)) {
      // showErrorDialog(
      //   errorMessage: 'Please enter a valid email.',
      //   context: context,
      // );
      return false;
    }
    return true;
  }

  bool passwordValidator({String? password, required BuildContext context}) {
    if (password == null || password.isEmpty) {
      // showErrorDialog(
      //   context: context,
      //   errorMessage: 'Please fill the Password',
      // );
      return false;
    } else if (password.length < 6) {
      // showErrorDialog(
      //   errorMessage: 'Minimum length of password should be 6 characters.',
      //   context: context,
      // );
      return false;
    }
    return true;
  }

  bool confirmPasswordValidator({
    String? password,
    String? confirmPassword,
    required BuildContext context,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      showErrorDialog(
        context: context,
        errorMessage: 'Please fill the confirm password',
      );
      return false;
    } else if (confirmPassword.length < 6) {
      showErrorDialog(
        errorMessage: 'Minimum length of password should be 6 characters.',
        context: context,
      );
      return false;
    } else if (password != confirmPassword) {
      showErrorDialog(
        errorMessage: "Password doesn't match, Please try again.",
        context: context,
      );
      return false;
    }
    return true;
  }

  bool nameValidator({String? name, required BuildContext context}) {
    if (name == null || name.isEmpty) {
      showErrorDialog(errorMessage: 'Please fill a name', context: context);
      return false;
    } else {
      return true;
    }
  }

  bool phoneNumberValidator({String? phoneNumber, required BuildContext context}) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      // showErrorDialog(
      //     errorMessage: 'Please fill a Phone Number', context: context);
      return false;
    } else if (phoneNumber.length < 12 || phoneNumber.length > 14) {
      // showErrorDialog(
      //   errorMessage: 'Length of phone number must be equal to 10',
      //   context: context,
      // );
      return false;
    } else {
      return true;
    }
  }
}
