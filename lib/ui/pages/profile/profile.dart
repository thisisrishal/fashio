// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/core/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/configs/appConstants.dart';
import 'package:fashio/ui/shared/components/texts.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final profileC = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: Icon(
              Icons.navigate_before_rounded,
              color: Colors.black,
              size: 26.sp,
            ),
            title: 'Profile',
          )),
      body: ListView(
        padding: EdgeInsets.all(8.sp),
        shrinkWrap: true,
        children: [
          AppSize.kSizedBox10h,
          Row(
            children: [
              Container(
                  width: 20.w,
                  height: 20.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                      fit: BoxFit.cover,
                    ),
                  )),
              AppSize.kSizedBox10w,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  HeadTitle(text: 'Mohammed Rishal'),
                  SubTitle(text: '@derlaxy')
                ],
              )
            ],
          ),
          AppSize.kSizedBox20h,
          GestureDetector(
            onTap: () {
              profileC.getUserDetails();
            },
            child: ProfileTile(
              leadingIcon: ChangeIconColor.iconMessage,
              title: 'Email',
              trailingText: 'mrishal.ap@gmail.com',
            ),
          ),
          ProfileTile(
            leadingIcon: ChangeIconColor.iconPhone,
            title: 'Phone Number',
            trailingText: '+91 8136860910',
          ),
          ProfileTile(
            leadingIcon: ChangeIconColor.iconPassword,
            title: 'Change Password',
            trailingText: '..............................',
          )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Widget leadingIcon;
  final String title;
  final String trailingText;
  const ProfileTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.trailingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp),
      child: ListTile(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: .3),
          borderRadius: BorderRadius.circular(5),
        ),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [leadingIcon, AppSize.kSizedBox10w, HeadTitle(text: title)],
        ),
        // title: const ,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SubTitle(text: trailingText),
            const Icon(Icons.navigate_next_rounded)
          ],
        ),
      ),
    );
  }
}
