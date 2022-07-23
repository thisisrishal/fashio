import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  Color color;
  String text;
  Color textColor;
  EdgeInsets? padding;
  CustomButton({
    Key? key,
    this.onPressed,
    this.padding,
    required this.color,
    required this.text,
    this.textColor = AppColor.kWhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size(333.sp, 48.sp),
          padding:padding),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
