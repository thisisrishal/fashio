// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/view/constants/appConstants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final Widget icon;
  final bool obscureText;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final String? Function(String?)? onChanged;

  const CustomTextField(
      {Key? key,
       this.controller,
      required this.label,
      required this.icon,
      this.obscureText = false,
      this.suffixIcon = const SizedBox(),
      this.keyboardType =  TextInputType.multiline,
      required this.validator,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
        // keyboardType: keyboard,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
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
            hintStyle:
                const TextStyle(fontSize: 12, color: AppColor.kLightGrey),
            prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: icon),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 24, minHeight: 24),
            suffixIcon: suffixIcon));
  }
}
