import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
 import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:fashio/view/constants/appConstants.dart';

import 'package:sizer/sizer.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: GestureDetector(onTap: Get.back, child: AppIcons.iconBack),
            title: 'Write Review',
          )),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadTitle(
                text:
                    'Please Write overall level of satisfaction with your shipping / Delivery Service',
                fontSize: 12.sp),
            AppSize.kSizedBox10h,
            Row(
              children: [
                RatingBar.builder(
                  // rating: _userRating,

                  itemBuilder: (context, index) => AppIcons.iconStar,
                  itemPadding: const EdgeInsets.only(right: 4.0),
                  itemCount: 5,
                  initialRating: 1,
                  minRating: 1,
                  itemSize: 20.sp,
                  unratedColor: Colors.amber.withAlpha(50),
                  glowColor: AppColor.kLightGrey,
                  direction: Axis.horizontal,
                  updateOnDrag: true,
                  allowHalfRating: true,

                  onRatingUpdate: (double value) {
                    // print(value);
                  },
                ),
                AppSize.kSizedBox10w,
                SubTitle(
                  text: '4/5',
                  fontSize: 12.sp,
                )
              ],
            ),
            AppSize.kSizedBox10h,
            AppSize.kSizedBox5h,
            HeadTitle(text: 'Write Your Review '),
            AppSize.kSizedBox10h,
            TextField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.kLightGrey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: AppColor.kDarkWhite)),
                  hintText: 'Write your review here',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontSize: 14, color: AppColor.kLightGrey)),
              expands: false,
              maxLines: 10,
              autofocus: true,
              // enabled: true,
            )
          ],
        ),
      ),
    );
  }
}
