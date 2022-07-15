// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/controllers/notification_controller.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';


class NotificationScreen extends StatelessWidget {
  final notificationC = Get.put(NotificationController());

  NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
              leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: AppIcons.iconBack),
              leadingWidth: 30,
              title: 'Notification',
            )),
        body: Obx(
          () => Padding(
            padding:  EdgeInsets.only(top:8.sp,left: 4.sp),
            child: ListView.builder(
              itemCount: notificationC.notifications.value.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomNotification(
                  width: width,
                  title:
                      notificationC.notifications.value[index].title.toString(),
                  description: notificationC.notifications.value[index].subtitle
                      .toString(),
                  date: notificationC.notifications.value[index].creatdAt!
                      .replaceRange(10, 24, ''),
                );
              },
            ),
          ),
        )
       
        );
  }
}

class CustomNotification extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  const CustomNotification({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChangeIconColor.iconOffer,
        AppSize.kSizedBox10w,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadTitle(
              text: title,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
            AppSize.kSizedBox5h,
            SizedBox(
              width: width - 22.w,
              child: SubTitle(text: description),
            ),
            AppSize.kSizedBox5h,
            SubTitle(
              text: date,
              color: AppColor.kDarkBlue,
            ),
            AppSize.kSizedBox20h
          ],
        ),
      ],
    );
  }
}
