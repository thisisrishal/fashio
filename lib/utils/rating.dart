import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../ui/shared/components/texts.dart';

class RatingIndicator extends StatelessWidget {
  final double rating;
  final double? itemSize;
  const RatingIndicator({Key? key, required this.rating, this.itemSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      
      
      // physics: NeverScrollableScrollPhysics(),
      rating: rating,
      itemBuilder: (context, index) => AppIcons.iconStar,
      itemCount: 5,
      itemSize: itemSize ?? 14.sp,
      direction: Axis.horizontal,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}




class CustomRatings extends StatelessWidget {
  final String text;
  final bool star;
  const CustomRatings({
    Key? key,
    required this.text,
    this.star = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          // color: AppColor.kThemeBlue,
          borderRadius: BorderRadius.circular(4.sp),
          border: Border.all(color: AppColor.kLightGrey.withOpacity(.2))),
      child: Row(
        children: [
          star
              ? SvgPicture.asset(
                  'assets/icons/S04tar.svg',
                  color: Colors.amber,
                  height: 12.sp,
                  width: 12.sp,
                )
              : Container(),
          AppSize.kSizedBox5w,
          SubTitle(
            text: text,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins-Thin',
            color: AppColor.kDarkBlue.withOpacity(.6),
          )
        ],
      ),
    );
  }
}
