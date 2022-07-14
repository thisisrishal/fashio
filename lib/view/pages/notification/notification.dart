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
        //  ListView(
        //   padding: EdgeInsets.all(3.w),
        //   physics: const BouncingScrollPhysics(),
        //   shrinkWrap: true,
        //   children: [
        //     GestureDetector(
        //       onTap: () {
        //         print('${notificationC.notifications.value[0].title } ui part');
        //       },
        //       child: CustomNotification(
        //         width: width,
        //         title: 'Offer Notification',
        //         description:
        //             'consectetur, from a Lorem Ipsumr.32 and 1.10.3gs a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
        //         date: 'April 30, 2014 1:01 PM',
        //       ),
        //     ),
        // CustomNotification(
        //   width: width,
        //   title: 'Offer Notification',
        //   description:
        //       'consectetur, from a Lorem Ipsumr.32 and 1.10.3gs a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham',
        //   date: 'April 30, 2014 1:01 PM',
        // ),
        //     CustomNotification(
        //       width: width,
        //       title: 'Offer Notification',
        //       description: 'Contrary to popular belief, Richard McClintoc',
        //       date: 'April 30, 2014 1:01 PM',
        //     )
        //   ],
        // )
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
