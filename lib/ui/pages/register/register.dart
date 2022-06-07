import 'package:fashio/ui/pages/home/home_screen.dart';
import 'package:fashio/ui/pages/login/components/components.dart';
import 'package:fashio/ui/shared/components/text_filed.dart';
import 'package:fashio/ui/shared/pages/navigatiton_bar/my_navigation_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/utils/constants.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/texts.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterScreen({Key? key}) : super(key: key);

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
               HeadTitle(text: 'Let\'s Get Started', fontSize: 16),
              const SubTitle(text: 'Create a new Account'),
              AppSize.kSizedBox20h,
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: _mobileController,
                        icon: AppIcons.iconPhone,
                        label: 'Mobile Number'),
                    AppSize.kSizedBox10h,
                    CustomTextField(
                        controller: _otpController,
                        icon: AppIcons.iconMessage,
                        label: 'Enter OTP'),
                    // AppSize.kSizedBox10h,
                    // CustomTextField(
                    //     controller: _passwordController,
                    //     icon: AppIcons.iconPassword,
                    //     label: 'Enter Password'),
                  ],
                ),
              ),
              AppSize.kSizedBox20h,
              CustomElevatedButton(
                color: AppColor.kDarkBlue,
                text: 'Sign Up',
                onPressed: () {
                  Get.to( MyNavigationBar());
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
                          style: const TextStyle(
                              color: AppColor.kLightGrey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                          children: <InlineSpan>[
                        TextSpan(
                            text: 'sign In',
                            style: const TextStyle(
                              color: AppColor.kDarkBlue,
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // print('sign in');
                                // log('Sign Up button Tapped');
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
