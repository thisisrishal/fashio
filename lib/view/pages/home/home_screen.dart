// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/controllers/all_products_controller.dart';
import 'package:fashio/controllers/cart_controller.dart';
import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/controllers/single_product_controller.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:fashio/view/pages/login/components/components.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/view/constants/appConstants.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeScreenC = Get.put(HomeScreenController());
  final productDetailC = Get.put(SingleProductController());
  var allProductsController = Get.put(AllProductsController());
  var cartController = Get.put(CartController());

  final RxInt _current = 0.obs;
  final CarouselController _controller = CarouselController();
  // final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: CustomAppBar(
                  leading: const Logo(),
                  // leadingWidth: 60,
                  title: 'Fashio',

                  trailing: GestureDetector(
                    onTap: () {
                      Get.toNamed('/notification');
                    },
                    child: AppIcons.iconNotification,
                  ),

                  trailing2: AppIcons.iconSearch,
                  trailing2OnTap: //goto search page using get
                      () {
                    Get.toNamed('/search');
                  },
                )),
            body: Obx(() => SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [],
                        ),
                      ),
                      AppSize.kSizedBox10h,
                      Stack(
                        children: [
                          CarouselSlider.builder(
                            carouselController: _controller,
                            itemCount: homeScreenC.bannerList.value.isEmpty
                                ? 0
                                : homeScreenC.bannerList.value.length,
                            itemBuilder: (BuildContext context, int index,
                                int pageViewIndex) {
                              return homeScreenC.bannerList.value.isNotEmpty
                                  ? CustomCarouselItem(
                                      index: index,
                                      title: 'Super Flash Sale \n 50% off',
                                      imageUrl: homeScreenC.bannerList
                                          .value[index].imgOne[0].url,
                                      subItem: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          // TimeContainer(time: '08'),
                                          // const CustomColon(),
                                          // TimeContainer(time: '34'),
                                          // const CustomColon(),
                                          // TimeContainer(time: '52'),
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
                          Positioned(
                            bottom: 18.sp,
                            left: 22.sp,
                            child: SlideCountdownSeparated(
                              width: 14.w,
                              height: 14.w,

                              // separatorType: SeparatorType.title,
                              textStyle: TextStyle(
                                  color: const Color(0xD1020D4D),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),

                              separatorStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold),
                              duration: homeScreenC.defaultDuration,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.sp),
                                  color: AppColor.kWhite),
                            ),
                          ),
                           Positioned(
                             bottom: 18.sp,
                              left: 22.sp,
                              child: Row(
                            children: const [
                             HeadTitle(text: 'Days'),
                             AppSize.kSizedBox10w,
                              HeadTitle(text: 'Hours'),
                             AppSize.kSizedBox10w,
                              HeadTitle(text: 'Minute'),
                             AppSize.kSizedBox10w,
                              HeadTitle(text: 'Second')
                            ],
                          ))
                        ],
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return Container(
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
                            );
                          }).toList(),
                        );
                      }),
                      AppSize.kSizedBox10h,
                      TextBar(
                        firstTitle: const HeadTitle(
                          text: 'Catetgory',
                          fontSize: 14,
                        ),
                        secondTitle: GestureDetector(
                          onTap: () {
                            Get.toNamed('/moreCategory');
                          },
                          child: const HeadTitle(
                            text: 'More Category',
                            fontSize: 13,
                            color: AppColor.kThemeBlue,
                          ),
                        ),
                      ),
                      AppSize.kSizedBox10h,
                      SizedBox(
                        height: 12.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // cacheExtent: 100000,
                          itemCount: homeScreenC.categoryList.value.isEmpty
                              ? 0
                              : homeScreenC.categoryList.value.length,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed('/categoryDetails',
                                    arguments:
                                        homeScreenC.categoryList.value[index]);
                              },
                              child: CategoryRound(
                                  title: homeScreenC.categoryList.value[index]
                                      .subcategoryname,
                                  index: index,
                                  imgSrc: homeScreenC.categoryList.value[index]
                                      .subCategoryImage[0].url),
                            );
                          },
                          shrinkWrap: true,
                        ),
                      ),
                      AppSize.kSizedBox10h,
                      TextBar(
                        firstTitle: const HeadTitle(
                          text: 'Flash Sale',
                          fontSize: 14,
                        ),
                        secondTitle: GestureDetector(
                          onTap: () {
                            Get.toNamed('/flashSale');
                          },
                          child: const HeadTitle(
                            text: 'See More',
                            fontSize: 13,
                            color: AppColor.kThemeBlue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenC.flashSaleList.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () async {
                                await productDetailC.fetchProductDetails(
                                    homeScreenC.flashSaleList.value[index].sId
                                        .toString());
                                cartController.fetchCartProducts();

                                Get.toNamed('/product_detail');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  top: 8,
                                  bottom: 8,
                                  right: 4,
                                ),
                                child: ProductCard(
                                  imgSrc: homeScreenC
                                      .flashSaleList.value[index].imgOne![0].url
                                      .toString(),
                                  name: homeScreenC
                                      .flashSaleList.value[index].productname
                                      .toString(),
                                  currentPrize: homeScreenC.flashSaleList
                                              .value[index].offerPrice
                                              .toString() ==
                                          '0'
                                      ? homeScreenC
                                          .flashSaleList.value[index].price
                                          .toString()
                                      : homeScreenC
                                          .flashSaleList.value[index].offerPrice
                                          .toString(),
                                  originalPrize: homeScreenC
                                      .flashSaleList.value[index].price
                                      .toString(),
                                  offer: homeScreenC
                                      .flashSaleList.value[index].discount
                                      .toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      AppSize.kSizedBox10h,
                      TextBar(
                        firstTitle: const HeadTitle(
                          text: 'Mega Sale',
                          fontSize: 14,
                        ),
                        secondTitle: GestureDetector(
                          onTap: () {
                            homeScreenC.fetchMegaSaleProduct();
                            Get.toNamed('/megaSale');
                          },
                          child: const HeadTitle(
                            text: 'See More',
                            fontSize: 13,
                            color: AppColor.kThemeBlue,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenC.megaSaleList.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                top: 8,
                                bottom: 8,
                                right: 4,
                              ),
                              child: ProductCard(
                                  imgSrc: homeScreenC
                                      .megaSaleList.value[index].imgOne[0].url,
                                  name: homeScreenC
                                      .megaSaleList.value[index].productname,
                                  currentPrize: homeScreenC.flashSaleList
                                              .value[index].offerPrice
                                              .toString() ==
                                          '0'
                                      ? homeScreenC
                                          .flashSaleList.value[index].price
                                          .toString()
                                      : homeScreenC
                                          .flashSaleList.value[index].offerPrice
                                          .toString(),
                                  originalPrize: homeScreenC
                                      .megaSaleList.value[index].price
                                      .toString(),
                                  offer: homeScreenC
                                      .megaSaleList.value[index].discount
                                      .toString()),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
                        child: GestureDetector(
                            onTap: () {
                              // homeScreenC.fetchRecommendedProduct();
                            },
                            child: CarouselSlider.builder(
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
                            )),
                      ),
                      AppSize.kSizedBox10h,
                      GestureDetector(
                        onTap: () {
                          // allProductsController.getAllProductDetails();
                        },
                        child: GridView.builder(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.0,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            mainAxisExtent: 33.h,
                          ),
                          itemCount:
                              homeScreenC.recommendedList.value.length.isOdd
                                  ? homeScreenC.recommendedList.value.length - 1
                                  : homeScreenC.recommendedList.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCard(
                              imgSrc: homeScreenC
                                  .recommendedList.value[index].imgOne[0].url
                                  .toString(),
                              name: homeScreenC
                                  .recommendedList.value[index].productname
                                  .toString(),
                              currentPrize: homeScreenC.recommendedList
                                          .value[index].offerPrice
                                          .toString() ==
                                      '0'
                                  ? homeScreenC
                                      .recommendedList.value[index].price
                                      .toString()
                                  : homeScreenC
                                      .recommendedList.value[index].offerPrice
                                      .toString(),
                              originalPrize: homeScreenC
                                  .recommendedList.value[index].price
                                  .toString(),
                              offer: homeScreenC
                                  .recommendedList.value[index].discount
                                  .toString(),
                              star: true,
                              ratingCount: double.parse(homeScreenC
                                  .recommendedList.value[index].rating.length
                                  .toString()),
                              imgWidth: 40.w,
                            );
                          },
                        ),
                      ),
                      AppSize.kSizedBox20h
                    ],
                  ),
                ))));
  }
}

class CustomCarouselItem extends StatelessWidget {
  final int index;
  final String title;
  final String imageUrl;
  final Widget subItem;
  const CustomCarouselItem({
    Key? key,
    required this.index,
    required this.title,
    required this.imageUrl,
    required this.subItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(children: [
        // AppSize.kSizedBox10h,
        Container(
            height: 400,
            width: 100.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
                color: Colors.green,
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ))),
        Positioned(bottom: 6.w, left: 2.w, child: subItem),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSize.kSizedBox10h,
              SizedBox(
                width: 60.w,
                child: Text(
                  title,
                  // homeScreenC.recommendedList.value[index].productname,
                  style: const TextStyle(
                    color: AppColor.kWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
