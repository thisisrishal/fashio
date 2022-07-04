// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/configs/appConstants.dart';

import 'package:fashio/ui/shared/components/texts.dart';

class CustomColon extends StatelessWidget {
  const CustomColon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeadTitle(
      text: ':',
      fontSize: 14.sp,
      color: AppColor.kWhite,
    );
  }
}

class TimeContainer extends StatelessWidget {
  String time;
  TimeContainer({
    Key? key,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.sp),
      child: Container(
        height: 14.w,
        width: 14.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.sp), color: AppColor.kWhite),
        child: Center(child: HeadTitle(text: time)),
      ),
    );
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner(
      {Key? key,
      required CarouselController controller,
      required RxInt current,
      String title = '',
      // required String offer,
      required List imageList,
      required Widget subRow,
      bool autoPlay = true,
      double padding = 10})
      : _controller = controller,
        _current = current,
        _title = title,
        // _offer = offer,
        imgNewList = imageList,
        subRow = subRow,
        padding = padding,
        autoPlay = autoPlay,
        super(key: key);

  final CarouselController _controller;
  final RxInt _current;
  final String _title;
  // final String _offer;
  final List imgNewList;
  final Widget subRow;
  final double padding;
  final bool autoPlay;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: _controller,
      itemCount: imgNewList.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
          Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Stack(children: [
          // AppSize.kSizedBox10h,
          Container(
              height: 400,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imgNewList[index]),
                      fit: BoxFit.cover),
                  color: Colors.green,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ))),
          Positioned(bottom: 6.w, left: 2.w, child: subRow),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.kSizedBox10h,
                SizedBox(
                  width: 60.w,
                  child: Text(
                    _title,
                    style: const TextStyle(
                      color: AppColor.kWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                )
                // HeadTitle(
                //   text: _title,
                //   color: AppColor.kWhite,
                //   fontSize: 24,
                // ),
                // HeadTitle(
                //   text: '$_offer% off',
                //   color: AppColor.kWhite,
                //   fontSize: 24,
                // )
              ],
            ),
          )
        ]),
      ),
      options: CarouselOptions(
          autoPlay: autoPlay,
          viewportFraction: 1,
          enlargeCenterPage: true,
          aspectRatio: 2,
          height: 25.h,
          onPageChanged: (index, reason) {
            _current.value = index;
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imgSrc;
  final String name;
  final String currentPrize;
  final String originalPrize;
  final String offer;
  final bool star;
  final double? imgWidth;
  final double? textWidth;
  bool delete;
  ProductCard(
      {Key? key,
      required this.imgSrc,
      required this.name,
      required this.currentPrize,
      required this.originalPrize,
      required this.offer,
      this.star = false,
      this.imgWidth,
      this.delete = false,
      this.textWidth
      //  this.imgWidth 30.w
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.kDarkWhite),
        borderRadius: BorderRadius.circular(4),
      ),
      // padding: const EdgeInsets.only(left: 4,top: 8,bottom: 8,right: 4),
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 14.h,
              width: imgWidth ?? 30.w,
              decoration: BoxDecoration(
                color: AppColor.kThemeBlue,
                borderRadius: BorderRadius.circular(4.0),
                image: DecorationImage(
                  image: NetworkImage(imgSrc),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSize.kSizedBox10h,
                CardText(
                  text: name,
                  width: textWidth,
                ),
                Row(children: star ? starsForRatings() : []),
                AppSize.kSizedBox10h,
                HeadTitle(
                    text: ' ₹$currentPrize',
                    color: AppColor.kThemeBlue,
                    fontSize: 12),
                AppSize.kSizedBox10h,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(' ₹$originalPrize',
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: AppColor.kLightGrey,
                          fontSize: 10,
                        )),
                    AppSize.kSizedBox10w,
                    HeadTitle(
                      text: '$offer% off',
                      color: AppColor.kNotificationRose,
                      fontSize: 10,
                    ),
                    AppSize.kSizedBox20w,
                    delete ? AppIcons.iconDelete : Container(),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CategoryRound extends StatelessWidget {
  final title;

  final int index;
  final String imgSrc;
  const CategoryRound({
    Key? key,
    required this.index,
    required this.imgSrc,required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.kWhite),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 1,
                    color: AppColor.kLightGrey.withOpacity(0.8),
                    spreadRadius: 0,
                    // blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 3))
              ],
            ),
            child: CircleAvatar(
              radius: 30.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(
                  imgSrc,
                  fit: BoxFit.fill,
                  scale: 1,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
          ),
          AppSize.kSizedBox5h,
          SubTitle(
            text: title,
            fontSize: 10.sp,
          )
        ],
      ),
    );
  }
}

class CardText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double? width;
  final Color color;
  final int? maxLines;
  final FontWeight fontWeight;

  const CardText({
    Key? key,
    required this.text,
    this.fontSize = 12,
    this.width,
    this.color = AppColor.kDarkBluePrimary,
    this.maxLines = 2,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width ?? 28.w,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 2,
        ));
  }
}

class TextBar extends StatelessWidget {
  final Widget firstTitle;
  final Widget? secondTitle;
  final double hPadding;
  final double vPadding;

  const TextBar({
    Key? key,
    required this.firstTitle,
    this.secondTitle,
    this.hPadding = 10,
    this.vPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          firstTitle,
          secondTitle ?? Container()
          // HeadTitle(
          //   text: firstTitle,
          //   fontSize: 14,
          // ),
          // Row(
          //   children: [
          //     HeadTitle(
          //       text: secondTitle,
          //       fontSize: 13,
          //       color: AppColor.kThemeBlue,
          //     ),

          //   ],
          // ),
        ],
      ),
    );
  }
}

const int _rating = 4;
List<Icon> starsForRatings() {
  List<Icon> stars = [];
  for (int i = 0; i < _rating; i++) {
    stars.add(const Icon(
      Icons.star_rate_rounded,
      size: 16,
      color: Colors.yellow,
    ));
  }
  for (int i = 0; i < 5 - _rating; i++) {
    stars.add(const Icon(
      Icons.star_rate_rounded,
      size: 16,
      color: AppColor.kDarkWhite,
      // color: Colors.yellow,
    ));
  }
  return stars;
}
