// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:fashio/ui/pages/register/register.dart';
import 'package:fashio/ui/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/utils/constants.dart';

import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/texts.dart';
import 'components/components.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 13.h),
                child: const Logo(),
              ),
              AppSize.kSizedBox10h,
               HeadTitle(text: 'Welcome to fashio', fontSize: 16),
              const SubTitle(text: 'sign in to continue'),
              AppSize.kSizedBox20h,
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: _emailController,
                        icon: AppIcons.iconPhone,
                        label: 'Mobile Number'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _passwordController,
                        icon: AppIcons.iconPassword,
                        label: 'Password'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          HeadTitle(text: 'Forgot Password?', fontSize: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomElevatedButton(
                color: AppColor.kDarkBlue,
                text: 'Sign In',
                onPressed: (){},
              
              ),
              AppSize.kSizedBox20h,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomDivider(),
                    SubTitle(
                      text: 'OR',
                      fontWeight: FontWeight.bold,
                    ),
                    CustomDivider(),
                  ],
                ),
              ),
              AppSize.kSizedBox20h,
              CustomElevatedButton(
                color: AppColor.kWhite,
                text: 'Request OTP',
                textColor: AppColor.kDarkBlue,
                  onPressed: () {
                  Get.to(RegisterScreen());
                },
              ),
              AppSize.kSizedBox20h,
              AppSize.kSizedBox10h,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                              color: AppColor.kLightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <InlineSpan>[
                        TextSpan(
                            text: 'sign Up',
                            style: const TextStyle(
                              color: AppColor.kDarkBlue,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('Sign Up button Tapped');
                              })
                      ])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
