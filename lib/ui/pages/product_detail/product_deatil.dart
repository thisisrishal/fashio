// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
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
        body: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            // padding:  EdgeInsets.symmetric(horizontal: 10.sp,),
            children: [
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
                  child: ListView(shrinkWrap: true, children: [
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
                                overlayColor:
                                    MaterialStateProperty.all(AppColor.kWhite),
                                onTap: () {
                                  _selectedSize.value = sizeList[index];
                                },
                                child: Obx(() => Padding(
                                      padding: EdgeInsets.only(right: 8.sp),
                                      child: CircleAvatar(
                                        backgroundColor: _selectedSize.value ==
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
                                    backgroundColor:
                                        _selectedColor.value == colorList[index]
                                            ? AppColor.kWhite
                                            : colorList[index],
                                    radius: 6.sp),
                              )))),
                    )),
                    AppSize.kSizedBox20h,
                    const HeadTitle(text: 'Specifications'),
                  ]))
            ]));
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

class RatingIndicator extends StatelessWidget {
  final double rating;
  const RatingIndicator({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (context, index) => AppIcons.iconStar,
      itemCount: 5,
      itemSize: 14.sp,
      direction: Axis.horizontal,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}
