import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/controllers/coupon_controller.dart';
import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/view/pages/home/home_screen.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';

import '../home/components/components.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({Key? key}) : super(key: key);
  final RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();
  final offerDetails = Get.put(CouponController());
  final homeScreenC = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                  leading: Center(
                      child: HeadTitle(
                    text: 'Offers',
                    fontSize: 20,
                  )),
                  leadingWidth: 80,
                )),
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // const Divider(color: Colors.black),
                // AppSize.kSizedBox20h,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 1.h,
                    ),
                    shrinkWrap: true,
                    itemCount: offerDetails.CouponDetails.value.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          width: 100.w,
                          height: 20.w,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColor.kThemeBlue,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HeadTitle(
                                text:
                                    'Use "${offerDetails.CouponDetails.value[index].code}" Coupon For \nGet ${offerDetails.CouponDetails.value[index].discount}% off',
                                color: AppColor.kWhite,
                                fontSize: 16),
                          ));
                    },
                  ),
                ),
                AppSize.kSizedBox10h,
                CarouselSlider.builder(
                  carouselController: _controller,
                  itemCount: homeScreenC.bannerList.value.isEmpty
                      ? 0
                      : homeScreenC.bannerList.value.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return homeScreenC.bannerList.value.isNotEmpty
                        ? CustomCarouselItem(
                            index: index,
                            title: 'Super Flash Sale \n 50% off',
                            imageUrl: homeScreenC
                                .bannerList.value[index].imgOne[0].url,
                            subItem: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TimeContainer(time: '08'),
                                const CustomColon(),
                                TimeContainer(time: '34'),
                                const CustomColon(),
                                TimeContainer(time: '52'),
                              ],
                            ),
                          )
                        : Container();
                  },
                  options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      aspectRatio: 2,
                      height: 25.h,
                      onPageChanged: (index, reason) {
                        _current.value = index;
                      }),
                ),
               
                AppSize.kSizedBox10h,
               CarouselSlider.builder(
                              carouselController: _controller,
                              itemCount:
                                  homeScreenC.recommendedList.value.length,
                              itemBuilder: (BuildContext context, int index,
                                      int pageViewIndex) =>
                                  CustomCarouselItem(
                                index: index,
                                title: homeScreenC
                                    .recommendedList.value[0].productname,
                                imageUrl: homeScreenC
                                    .recommendedList.value[index].imgOne[0].url,
                                subItem: SubTitle(
                                  text: 'we make the best for you',
                                  color: AppColor.kDarkGrey,
                                  fontSize: 14.sp,
                                ),
                              ),
                              options: CarouselOptions(
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  enlargeCenterPage: true,
                                  aspectRatio: 2,
                                  height: 25.h,
                                  onPageChanged: (index, reason) {
                                    _current.value = index;
                                  }),
                            )
              ],
            )));
  }
}
