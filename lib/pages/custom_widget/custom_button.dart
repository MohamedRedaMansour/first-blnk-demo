// @dart=2.9
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  Function onPress;

  CustomButton({Key key, @required this.text,@required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .8,
      height: MediaQuery.of(context).size.height * .07,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all<Color>(
                  Colors.orange),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(18.0),
                      side: const BorderSide(
                          color: Colors.orange)))),
          onPressed:onPress ,
          child:  Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
