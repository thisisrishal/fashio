
import 'package:fashio/controllers/profile_controller.dart';
import 'package:fashio/controllers/sign_in_controller.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/view/constants/appConstants.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final loginSignInC = Get.put(LoginSignInController());


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
        body: Obx(
          () => ListView(
            padding: EdgeInsets.all(8.sp),
            shrinkWrap: true,
            children: [
              AppSize.kSizedBox10h,
              Row(
                children: [
                  Container(
                      width: 20.w,
                      height: 20.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(profileC.image.value.isNotEmpty
                              ? profileC.image.value
                              : "https://secure.gravatar.com/avatar/b732b6f4cd6913b53f735c0a0d923ea1?s=96&d=https%3A%2F%2Fwww.techzine.nl%2Fwp-content%2Fthemes%2Ftechzinev10%2Fimg%2Ficons%2Fusericon.png&r=g"),

                          // 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M)3x8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                          fit: BoxFit.cover,
                        ),
                      )),
                  AppSize.kSizedBox10w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadTitle(text: profileC.name.value),
                      SubTitle(text: profileC.userName.value)
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
                  trailingText: profileC.email.value,
                ),
              ),
              ProfileTile(
                leadingIcon: ChangeIconColor.iconPhone,
                title: 'Phone Number',
                trailingText: profileC.phone.value,
              ),
              ProfileTile(
                leadingIcon: ChangeIconColor.iconPassword,
                title: 'Change Password',
                trailingText: '..............................',
              ),
              GestureDetector(
                onTap: () {
                  loginSignInC.logout();
                },
                child: ProfileTile(
                  leadingIcon: ChangeIconColor.iconLogout,
                  title: 'Logout',
                  trailingText: '',
                ),
              ),

            ],
          ),
        ));
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
