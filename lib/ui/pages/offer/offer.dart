import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../home/components/components.dart';

class OfferScreen extends StatelessWidget {
  OfferScreen({Key? key}) : super(key: key);
  final RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var w;
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
                  child: Container(
                      width: 100.w,
                      height: 20.w,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColor.kThemeBlue,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: HeadTitle(
                            text: 'Use "MEGSL" Coupon For \nGet 90% off',
                            color: AppColor.kWhite,
                            fontSize: 16),
                      )),
                ),
                AppSize.kSizedBox10h,
                CustomBanner(
                  controller: _controller,
                  current: _current,
                  title: 'Super Flash Sale \n50% off',
                  // offer: '50',
                  imageList: imgList,
                  subRow: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TimeContainer(time: '08'),
                      const CustomColon(),
                      TimeContainer(time: '34'),
                      const CustomColon(),
                      TimeContainer(time: '52'),
                    ],
                  ),
                ),
                AppSize.kSizedBox10h,
                CustomBanner(
                  controller: _controller,
                  current: _current,
                  title: '90% off Super Mega \nSale ',
                  // offer: 'Product',
                  imageList: imgList,
                  subRow: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SubTitle(
                      text: 'We recommend the Best for you',
                      color: AppColor.kWhite,
                    ),
                  ),
                ),
              ],
            )));
  }
}
