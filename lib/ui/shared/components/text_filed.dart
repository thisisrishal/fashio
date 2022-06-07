import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final Widget icon;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: TextEditingController(),
        style: const TextStyle(height: 1),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColor.kLightGrey,
            // width: 0,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColor.kDarkBlue,
            width: 1,
          )),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.kLightGrey,
              width: 0,
            ),
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: AppColor.kLightGrey,
            fontSize: 12.sp,
          ),
          // hintText: 'Enter Your Mobile Number',
          hintStyle: const TextStyle(fontSize: 12, color: AppColor.kLightGrey),
          prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8), child: icon),
          prefixIconConstraints:
              const BoxConstraints(minWidth: 24, minHeight: 24),
        ));
  }
}
