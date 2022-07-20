import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/shared/components/custom_button.dart';
import 'package:fashio/view/shared/components/text_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/validations.dart';

class EditProfile extends StatelessWidget {
   EditProfile({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: constPadding,
        children: [
          CustomTextField(
              validator: (val) => validateName(val!),
              //  onChanged: loginSignInC.firstName,
              icon: const Icon(Icons.person),
              label: 'Full Name'),
          AppSize.kSizedBox10h,
          CustomTextField(
              validator: (value) => validateMobile(value!),
              //  onChanged: loginSignInC.mobileNumber,
              icon: const Icon(Icons.phone),
              label: 'Mobile Number'),
          AppSize.kSizedBox10h,
          CustomTextField(
              validator: (value) => validateEmail(value!),
              //  onChanged: loginSignInC.email,
              icon: const Icon(Icons.email),
              label: 'Email'),
          AppSize.kSizedBox10h,
          CustomTextField(
              validator: (value) => validatePassword(value!),
              //  onChanged: loginSignInC.password,
              icon: const Icon(Icons.lock),
              label: 'Password'),
          AppSize.kSizedBox20h,
          CustomButton(
            color: AppColor.kDarkBlue,
            text: 'Continue',
            onPressed: () {
              //  if (_formKey.currentState!.validate() ||
              //      loginSignInC.email.value.isNotEmpty ||
              //      loginSignInC.mobileNumber.value.isNotEmpty ||
              //      loginSignInC.email.value.isNotEmpty) {
              //    loginSignInC.register(context);
              //  }
            },
          ),
          AppSize.kSizedBox20h,
          AppSize.kSizedBox10h,
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                ]))
          ]),
        ],
      ),
    );
  }
}
