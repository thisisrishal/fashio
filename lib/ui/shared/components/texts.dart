// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class HeadTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  HeadTitle({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.color = AppColor.kDarkBlue,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  const SubTitle({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.normal,
     this.color= AppColor.kLightGrey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontWeight: fontWeight,fontSize: fontSize),
    );
  }
}
