// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fashio/controllers/sign_in_controller.dart';
import 'package:fashio/view/constants/validations.dart';

import 'package:fashio/view/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/texts.dart';
import 'components/components.dart';

class LoginMobileScreen extends StatelessWidget {
  final loginSignInC = Get.put(LoginSignInController());

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                margin: EdgeInsets.only(top: 12.h),
                child: const Logo(),
              ),
              AppSize.kSizedBox10h,
              HeadTitle(text: 'Welcome to fashio', fontSize: 16.sp),
              const SubTitle(text: 'sign in to continue'),
              AppSize.kSizedBox20h,
              Padding(
                padding: const EdgeInsets.all(0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          controller: _mobileController,
                          keyboardType: TextInputType.phone,
                          validator: (val) => validateMobile(val!),
                          icon: const Icon(Icons.phone),
                          label: 'Mobile Number'),
                      AppSize.kSizedBox10h,
                      CustomTextField(
                          controller: _otpController,
                          keyboardType: TextInputType.phone,
                          validator: (val) {
                            return null;
                          },
                          // validator: (value)=> validateOTP(value!) ,
                          icon: const Icon(Icons.lock),
                          label: 'OTP'),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if(_formKey.currentState!.validate()){
                                    loginSignInC.mobileNumber.value =
                                        _mobileController.text;
                                    loginSignInC.requestOTP(context);

                                  }
                                  
                                },
                                child: HeadTitle(
                                    text: 'Request OTP', fontSize: 10.sp)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppSize.kSizedBox10h,
              CustomButton(
                color: AppColor.kDarkBlue,
                text: 'Sign In',
                onPressed: () {
                  loginSignInC.Otp.value = _otpController.text;
                  if (_formKey.currentState!.validate()) {
                    loginSignInC.verifyOtp(context);
                  }

                  // Get.offAllNamed('/');
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
                text: 'Login with Email',
                textColor: AppColor.kDarkBlue,
                onPressed: () {
                  Get.offNamed('elogin');
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
                          text: ' sign Up',
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
