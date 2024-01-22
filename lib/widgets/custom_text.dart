import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  TextStyle? style;
  double? fontSize;
  TextOverflow? overflow;
  TextAlign? textAlign;
  FontWeight? fontWeight;
  Color? textColor;

  CustomText({
    super.key,
    required this.text,
    this.style,
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.textAlign,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: style,
      // TextStyle(
      //   fontSize: fontSize,
      //   fontWeight: fontWeight,
      //   color: textColor,
      // ),
    );
  }
}
