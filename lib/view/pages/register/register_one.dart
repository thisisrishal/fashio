import 'package:fashio/controllers/sign_in_controller.dart';
import 'package:fashio/view/constants/validations.dart';
import 'package:fashio/view/pages/login/components/components.dart';
import 'package:fashio/view/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/texts.dart';

class RegisterScreenOne extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                        validator: (val) => validateName(val!),
                        onChanged: loginSignInC.firstName,
                        icon: const Icon(Icons.person),
                        label: 'Full Name'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _mobileController,
                        validator: (value) => validateMobile(value!),
                        onChanged: loginSignInC.mobileNumber,
                        icon: const Icon(Icons.phone),
                        label: 'Mobile Number'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _emailController,
                        validator:(value)=> validateEmail(value!),
                        onChanged: loginSignInC.email,
                        icon: const Icon(Icons.email),
                        label: 'Email'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _passwordController,
                        validator: (value) => validatePassword(value!),
                        onChanged: loginSignInC.password,
                        icon: const Icon(Icons.lock),
                        label: 'Password'),
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
                          text: ' sign In',
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
