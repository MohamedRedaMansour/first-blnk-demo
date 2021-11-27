import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  //const CustomText({Key? key}) : super(key: key);

  final String text;
  final Color color;
  final Alignment alignment;
  final double fontSize;
  final FontWeight fontWeight ;
  final double height;
  // final double height;
  // final int maxLine ;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.fontWeight = FontWeight.normal,
    this.height = 1
    // this.maxLine ,
    // this.height = 1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text, style: TextStyle(fontSize: fontSize,height:height ,letterSpacing: 1.0, color: color,fontWeight: fontWeight,/*height: height*/),/*maxLines: maxLine,*/),
    );
  }
}