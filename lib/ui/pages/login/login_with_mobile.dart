// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fashio/ui/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fashio/configs/appConstants.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
 import '../../shared/components/custom_button.dart';
import '../../shared/components/texts.dart';
import 'components/components.dart';

class LoginMobileScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginMobileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 13.h),
                child: const Logo(),
              ),
              AppSize.kSizedBox10h,

              HeadTitle(text: 'Welcome to fashio', fontSize: 16.sp),
              const SubTitle(text: 'sign in to continue'),
              AppSize.kSizedBox20h,
              // SizedBox(height: 3.h),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return '';
                        },
                        icon: AppIcons.iconMessage,
                        label: 'Mobile Number'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return '';
                        },
                        icon: AppIcons.iconPassword,
                        label: 'OTP'),
                    Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          HeadTitle(text: 'Request OTP', fontSize: 10.sp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                color: AppColor.kDarkBlue,
                text: 'Sign In',
                onPressed: () {
                  Get.offAllNamed('/');
                },
              ),
              AppSize.kSizedBox10h,
              AppSize.kSizedBox5h,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp),
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
              AppSize.kSizedBox10h,
              AppSize.kSizedBox5h,

              CustomButton(
                color: AppColor.kWhite,
                text: 'Login with OTP',
                textColor: AppColor.kDarkBlue,
                onPressed: () {
                  // Get.offAll(RegisterScreen());
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
                          style: TextStyle(
                              color: AppColor.kLightGrey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                          children: <InlineSpan>[
                        TextSpan(
                          text: 'sign Up',
                          style: TextStyle(
                            color: AppColor.kDarkBlue,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w900,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed('/regOne'),
                        )
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
