// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/ui/pages/home/components/components.dart';
import 'package:fashio/ui/pages/login/components/components.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              // title: HeadTitle(text: 'Fashio',fontSize: 20,),
              leadingWidth: 44,
              leading: const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Logo(),
              ),
              actions: [
                AppIcons.iconSearch,
                AppSize.kSizedBox10w,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: AppIcons.iconNotification,
                )
              ],
              backgroundColor: AppColor.kWhite,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [],
                    ),
                  ),
                  AppSize.kSizedBox10h,
                  CustomBanner(
                    controller: _controller,
                    current: _current,
                    title: 'Super Flash Sale \n 50% off',
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
                  AppSize.kSizedBox20h,
                  const TextBar(
                      firstTitle: 'Catetgory', secondTitle: 'More Category'),
                  AppSize.kSizedBox20h,
                  SizedBox(
                    height: 12.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryRound(
                            index: index, imgSrc: imgList[index]);
                      },
                      itemCount: 10,
                      shrinkWrap: true,
                    ),
                  ),
                  AppSize.kSizedBox10h,
                  const TextBar(
                      firstTitle: 'Flash Sale', secondTitle: 'See More'),
                  // AppSize.kSizedBox10h,
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
                  AppSize.kSizedBox10h,
                  const TextBar(
                      firstTitle: 'Mega Sale', secondTitle: 'See more'),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: CustomBanner(
                      controller: _controller,
                      current: _current,
                      title: 'Recommended \nProduct ',
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
                  ),
                  AppSize.kSizedBox10h,
                  GridView.builder(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      mainAxisExtent: 33.h,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        imgSrc: imgList[index],
                        name: 'FS - Nike Air max 270 React new',
                        currentPrize: '2999',
                        originalPrize: '4999',
                        offer: '24',
                        star: true,
                        imgWidth: 40.w,
                      );
                    },
                  ),
                  AppSize.kSizedBox20h
                ],
              ),
            )));
  }
}
