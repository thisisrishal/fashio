// import 'package:fashio/ui/pages/login/components/components.dart';
// import 'package:fashio/ui/shared/components/text_filed.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:sizer/sizer.dart';
// import 'package:fashio/configs/appConstants.dart';

//  import '../../shared/components/custom_button.dart';
// import '../../shared/components/texts.dart';

// class RegisterScreenTwo extends StatelessWidget {
//     final _formKey = GlobalKey<FormState>();

//   final TextEditingController _otpController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   // final TextEditingController _passwordController = TextEditingController();

//   RegisterScreenTwo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8.sp),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.only(top: 13.h),
//                 child: const Logo(),
//               ),
//               AppSize.kSizedBox10h,
//               HeadTitle(text: 'Let\'s Get Started', fontSize: 16.sp),
//               const SubTitle(text: 'Create a new Account'),
//               AppSize.kSizedBox20h,
//               Column(
//                 children: [
//                   CustomTextField(
//                       controller:_otpController,
//                       validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return '';
//                   },
//                       icon: AppIcons.iconMessage,
//                       label: 'OTP'),
//                   AppSize.kSizedBox10h,
//                   CustomTextField(
//                       controller: _otpController,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter email';
//                         }
//                         return '';
//                       },
//                       icon: AppIcons.iconPassword,
//                       label: 'Password'),
//                 ],
//               ),
//               AppSize.kSizedBox20h,
//               CustomButton(
//                 color: AppColor.kDarkBlue,
//                 text: 'Sign Up',
//                 onPressed: () {
//                   // Get.to(const MyNavigationBar());
//                   Get.toNamed('/');
//                 },
//               ),
//               AppSize.kSizedBox20h,
//               AppSize.kSizedBox10h,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   RichText(
//                       text: TextSpan(
//                           text: ' have a account?',
//                           style: TextStyle(
//                               color: AppColor.kLightGrey,
//                               fontSize: 10.sp,
//                               fontWeight: FontWeight.w500),
//                           children: <InlineSpan>[
//                         TextSpan(
//                           text: 'sign In',
//                           style: TextStyle(
//                             color: AppColor.kDarkBlue,
//                             fontSize: 11.sp,
//                             fontWeight: FontWeight.w900,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () => Get.toNamed('/login'),
//                         )
//                       ])),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
