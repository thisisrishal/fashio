import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

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
