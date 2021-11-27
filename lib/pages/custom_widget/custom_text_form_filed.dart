import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;

  final String hint;

  final void Function(String?)? onSaved;

  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  final TextInputType? textInputType;

  final GestureDetector? icon;
  bool? obscureText ;

  CustomTextFormField(
      {required this.text,
        required this.hint,
        required this.onSaved,
        this.onChanged,
        required this.validator,
        this.textInputType,
        this.icon,
        this.obscureText
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        Container(
          height: MediaQuery.of(context).size.height * .06,
          child: TextFormField(
            obscureText : obscureText ?? false ,
            onSaved: onSaved,
            onChanged: onChanged,
            validator: validator,
            cursorColor: Colors.orange,
            keyboardType: textInputType,
            decoration: InputDecoration(
                hintText: hint,
                suffixIcon: icon,
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white),
          ),
        )
      ],
    );
  }
}
