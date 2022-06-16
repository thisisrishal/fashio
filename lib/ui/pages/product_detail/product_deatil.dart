// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/ui/pages/review/review_product.dart';
import 'package:fashio/utils/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';

import '../home/components/components.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key}) : super(key: key);
  final RxInt _current = 0.obs;
  final RxString _selectedSize = ''.obs;
  final Rx<Color> _selectedColor = Colors.transparent.obs;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.sp),
            child: CustomAppBar(
                leading: AppIcons.iconBack,
                leadingWidth: 20.sp,
                title: 'The Nike Air Max 270 React ENG ',
                trailing2: AppIcons.iconSearch,
                trailing: AppIcons.iconMore)),
        body: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return false;
            },
            child: ListView(children: [
              CustomBanner(
                  controller: _controller,
                  current: _current,
                  padding: 0,
                  imageList: imgList,
                  autoPlay: false,
                  subRow: Container()),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () {
                        _controller.animateToPage(entry.key);
                        // print('======${entry.key}===========');
                      },
                      child: Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // ignore: unrelated_type_equality_checks
                          color: _current == entry.key
                              ? AppColor.kThemeBlue
                              : AppColor.kDarkWhite,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CustomRow(leading: Container(), trailing: Container()),
                        AppSize.kSizedBox5h,
                        const RatingIndicator(rating: 4.5),
                        AppSize.kSizedBox20h,
                        HeadTitle(
                            text: ' ₹2999.99',
                            color: AppColor.kThemeBlue,
                            fontSize: 16.sp),
                        AppSize.kSizedBox20h,
                        const HeadTitle(text: 'Select Size'),
                        AppSize.kSizedBox10h,
                        Row(
                          children: List.generate(
                              sizeList.length,
                              (index) => InkWell(
                                    overlayColor: MaterialStateProperty.all(
                                        AppColor.kWhite),
                                    onTap: () {
                                      _selectedSize.value = sizeList[index];
                                    },
                                    child: Obx(() => Padding(
                                          padding: EdgeInsets.only(right: 8.sp),
                                          child: CircleAvatar(
                                            backgroundColor:
                                                _selectedSize.value ==
                                                        sizeList[index]
                                                    ? AppColor.kThemeBlue
                                                    : AppColor.kDarkWhite,
                                            // index == _selectedItem.value
                                            //     ? Colors.red
                                            //     : AppColor.kWhite,
                                            radius: 6.w,
                                            child: CircleAvatar(
                                              backgroundColor: AppColor.kWhite,
                                              child: HeadTitle(
                                                text: sizeList[index],
                                              ),
                                            ),
                                          ),
                                        )),
                                  )),
                        ),
                        AppSize.kSizedBox20h,
                        const HeadTitle(text: 'Select Color'),
                        AppSize.kSizedBox10h,
                        Row(
                            children: List.generate(
                          colorList.length,
                          (index) => InkWell(
                              overlayColor:
                                  MaterialStateProperty.all(AppColor.kWhite),
                              onTap: () {
                                _selectedColor.value = colorList[index];
                              },
                              child: Obx(() => Padding(
                                  padding: EdgeInsets.only(right: 8.sp),
                                  child: CircleAvatar(
                                    backgroundColor: colorList[index],
                                    radius: 20,
                                    child: CircleAvatar(
                                        backgroundColor: _selectedColor.value ==
                                                colorList[index]
                                            ? AppColor.kWhite
                                            : colorList[index],
                                        radius: 6.sp),
                                  )))),
                        )),
                        AppSize.kSizedBox20h,
                        const HeadTitle(text: 'Specifications'),
                        AppSize.kSizedBox10h,
                        SubTitle(
                            text:
                                'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                            color: AppColor.kLightGrey.withOpacity(.8)),
                        AppSize.kSizedBox20h,
                        const TextBar(
                          firstTitle: 'Review Product',
                          secondTitle: 'See More',
                          hPadding: 0,
                        ),
                        AppSize.kSizedBox5h,
                        Row(children: [
                          RatingIndicator(
                            rating: 4,
                            itemSize: 12.sp,
                          ),
                          const ReviewText(
                            rating: '4.5',
                            ratingCount: '2995',
                          ),
                        ]),
                        AppSize.kSizedBox20h,
                        const ReviewDetail(
                          itemCount: 1,
                          padding: 0,
                        ),
                        AppSize.kSizedBox20h,
                        const TextBar(
                          firstTitle: 'You Might Also Like',
                          vPadding: 0,
                        ),
                        AppSize.kSizedBox10h,
                        SizedBox(
                          height: 33.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  bottom: 8,
                                  right: 4,
                                ),
                                child: ProductCard(
                                    imgSrc: imgList[index],
                                    name: 'FS - Nike Air max 270 React new',
                                    currentPrize: '2999',
                                    originalPrize: '4999',
                                    offer: '24'),
                              );
                            },
                          ),
                        ),
                      ]))
            ])));
  }
}

class ReviewText extends StatelessWidget {
  final String rating;
  final String ratingCount;
  const ReviewText({
    Key? key,
    required this.rating,
    required this.ratingCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
            text: rating,
            style: TextStyle(
                color: AppColor.kLightGrey,
                fontWeight: FontWeight.bold,
                fontSize: 8.sp)),
        TextSpan(
            text: ' ($ratingCount reviews)',
            style: TextStyle(
              fontSize: 8.sp,
              color: AppColor.kLightGrey,
            ))
      ],
    ));
  }
}

class CustomRow extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  const CustomRow({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 80.w,
            child: HeadTitle(
              text: 'Nike Air Zoom Pegasus 36 Miami',
              fontSize: 16.sp,
            )),
        const Icon(
          Icons.favorite_border_outlined,
          color: AppColor.kLightGrey,
        )
      ],
    );
  }
}
