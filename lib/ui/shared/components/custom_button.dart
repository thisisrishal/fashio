import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  Color color;
  String text;
  Color textColor;
  CustomButton({
    Key? key,
    this.onPressed,
    required this.color,
    required this.text,
    this.textColor = AppColor.kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color, minimumSize: Size(333.sp, 48.sp)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
