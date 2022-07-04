import 'package:fashio/core/controllers/sign_in_controller.dart';
import 'package:fashio/ui/pages/login/components/components.dart';
import 'package:fashio/ui/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fashio/configs/appConstants.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/texts.dart';

class RegisterScreenOne extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final loginSignInC = Get.put(LoginSignInController());

  RegisterScreenOne({Key? key}) : super(key: key);

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
              HeadTitle(text: 'Let\'s Get Started', fontSize: 16.sp),
              const SubTitle(text: 'Create a new Account'),
              AppSize.kSizedBox20h,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        controller: _nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return '';
                        },
                        onChanged: loginSignInC.firstName,
                        icon: AppIcons.iconPerson,
                        label: 'Full Name'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _mobileController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return '';
                        },
                        onChanged: loginSignInC.mobileNumber,
                        icon: AppIcons.iconPhone,
                        label: 'Mobile Number'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return '';
                        },
                        onChanged: loginSignInC.email,
                        icon: AppIcons.iconMessage,
                        label: 'Email'),
                  ],
                ),
              ),
              AppSize.kSizedBox20h,
              CustomButton(
                color: AppColor.kDarkBlue,
                text: 'Continue',
                onPressed: () {
               

                  if (_formKey.currentState!.validate() ||
                      loginSignInC.email.value.isNotEmpty ||
                      loginSignInC.mobileNumber.value.isNotEmpty ||
                      loginSignInC.email.value.isNotEmpty) {
                    loginSignInC.register(context);
                  }

                  // loginSignInC.reg
                  // Get.to(const MyNavigationBar());
                  // loginSignInC.firstName.value = ;

                  // Get.toNamed('/regTwo');
                },
              ),
              AppSize.kSizedBox20h,
              AppSize.kSizedBox10h,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                      text: TextSpan(
                          text: ' have a account?',
                          style: TextStyle(
                              color: AppColor.kLightGrey,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500),
                          children: <InlineSpan>[
                        TextSpan(
                          text: 'sign In',
                          style: TextStyle(
                            color: AppColor.kDarkBlue,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w900,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed('/elogin'),
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
