// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/ui/pages/home/components/components.dart';
import 'package:fashio/ui/pages/login/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:fashio/ui/shared/components/text_filed.dart';
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
            body: Container(
                // margin: const EdgeInsets.all( 8),
                // padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        // SizedBox( child: Logo()),
                        // SizedBox(
                        //     width: 70.w,
                        //     height: 5.h,
                        //     child: CustomTextField(
                        //         controller: _searchController,
                        //         label: 'Search Product',
                        //         icon: AppIcons.iconSearch)),
                        // AppIcons.iconFavourite,
                        // AppSize.kSizedBox10w,
                        // AppIcons.iconNotification
                      ],
                    ),
                  ),
                  AppSize.kSizedBox20h,
                  CustomBanner(
                    controller: _controller,
                    current: _current,
                    title: 'Super Flash Sale',
                    offer: '50',
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
                                  : AppColor.KDarkWhite,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ))));
  }
}
