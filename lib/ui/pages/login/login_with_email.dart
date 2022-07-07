// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fashio/core/controllers/sign_in_controller.dart';
import 'package:fashio/ui/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:fashio/configs/appConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../shared/components/custom_button.dart';
import '../../shared/components/texts.dart';
import 'components/components.dart';

class LoginEmailScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late String email;
  late String password;

  final loginSignInC = Get.put(LoginSignInController());

  LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isObscure = true.obs;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 0),
          child: AppBar(
            elevation: 0,
            systemOverlayStyle:
                customOverlayStyle(AppColor.kWhite, Brightness.dark),
          )),
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                          onChanged: loginSignInC.email,
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (validateEmail(value)) {
                              return '';
                            }
                            return 'Please enter a valid email';
                          },
                          icon: AppIcons.iconMessage,
                          label: 'Email'),
                      AppSize.kSizedBox10h,
                      Obx(
                        () => CustomTextField(
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: loginSignInC.password,
                            obscureText: isObscure.value,
                            //  true,
                            validator: (value) {
                              if (validatePassword(value)) {
                                return '';
                              }
                              return 'Please enter a valid password';
                            },
                            icon: AppIcons.iconPassword,
                            label: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscure.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                isObscure.value = !isObscure.value;
                              },
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            HeadTitle(
                                text: 'Forgot Password?', fontSize: 10.sp),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                color: AppColor.kDarkBlue,
                text: 'Sign In',
                onPressed: () {
                 
                  if (_formKey.currentState!.validate() ||
                      loginSignInC.email.value.isNotEmpty ||
                      loginSignInC.password.value.isNotEmpty) {
                    loginSignInC.login(context);
                  }
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
                  Get.offAndToNamed('/mlogin');
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
                            ..onTap = () => Get.offAndToNamed('/regOne'),
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

  bool validateEmail(String? value) {
    String pattern = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool validatePassword(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
