// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fashio/configs/appConstants.dart';

class HeadTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? color;
  final FontWeight fontWeight;
  final String fontFamily;
  const HeadTitle({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.bold,
    this.fontFamily = 'poppins',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? const Color(0xD1020D4D),
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;
  const SubTitle({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
    this.color = AppColor.kLightGrey,
    this.fontFamily = 'poppins',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: fontFamily),
    );
  }
}
