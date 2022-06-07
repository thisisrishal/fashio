import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  Color color;
  String text;
  Color textColor;
  CustomElevatedButton({
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
          primary: color, minimumSize: const Size(343, 57)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
