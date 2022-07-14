import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoreCategoryScreen extends StatelessWidget {
  MoreCategoryScreen({Key? key}) : super(key: key);

  final homeScreenC = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .3,
        toolbarHeight: 10.h,
        backgroundColor: AppColor.kWhite,
        automaticallyImplyLeading: false,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 40,
                spreadRadius: 10,
              ),
            ],
          ),
          child: const SearchBarCustom(
            autofocus: false,
          ),
        ),
        actions: [
          IconButton(
            icon: AppIcons.iconFavourite,
            onPressed: () {},
          ),
          IconButton(onPressed: () {}, icon: AppIcons.iconNotification)
        ],
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          crossAxisCount: 4,
          padding: EdgeInsets.all(5.sp),
          children: List.generate(
            homeScreenC.categoryList.value.isEmpty
                ? 0
                : homeScreenC.categoryList.value.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 1,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: CategoryRound(
                      index: index,
                      imgSrc: homeScreenC
                          .categoryList.value[index].subCategoryImage[0].url,
                      title:
                          homeScreenC.categoryList.value[index].subcategoryname,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

