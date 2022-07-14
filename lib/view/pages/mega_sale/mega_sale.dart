import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/appConstants.dart';

class MegaSaleScreen extends StatelessWidget {
  MegaSaleScreen({Key? key}) : super(key: key);

  final homeScreenC = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kWhite,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppIcons.iconBack,
          ),
          leadingWidth: 20.sp,
          title: HeadTitle(text: 'Mega Sale', fontSize: 14.sp),
          actions: [
            AppIcons.iconSearch,
            AppSize.kSizedBox10w,
            const Icon(
              Icons.mic_none_outlined,
              color: AppColor.kDarkGrey,
            ),
            AppSize.kSizedBox10w,
            GestureDetector(
                onTap: () {

                },
                child: AppIcons.iconCart),
            AppSize.kSizedBox10w
          ],
        ),
        body: AnimationLimiter(
          child: GridView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 5.0,
              mainAxisExtent: 33.h,
            ),
            itemCount: homeScreenC.megaSaleList.value.isEmpty
                ? 0
                : homeScreenC.megaSaleList.value.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: 8.sp),
                child: ProductCard(
                  imgSrc: homeScreenC.megaSaleList.value[index].imgOne![0].url
                      .toString(),
                  name: homeScreenC.megaSaleList.value[index].productname
                      .toString(),
                  currentPrize:
                      homeScreenC.megaSaleList.value[index].offerPrice == 0
                          ? homeScreenC.megaSaleList.value[index].price
                              .toString()
                          : homeScreenC.megaSaleList.value[index].offerPrice
                              .toString(),
                  originalPrize:
                      homeScreenC.megaSaleList.value[index].price.toString(),
                  offer:
                      homeScreenC.megaSaleList.value[index].discount.toString(),
                  // offer: '24',
                  star: true,
                  ratingCount: 
                  homeScreenC.megaSaleList.value[index].rating.isEmpty ? 1:double.parse(homeScreenC
                          .megaSaleList.value[index].rating[0].rateValue),
            
                  

                  imgWidth: 40.w,
                ),
              );
            },
          ),
        ));
  }
}
