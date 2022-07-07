// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fashio/configs/rating.dart';
import 'package:fashio/ui/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/configs/appConstants.dart';
import 'package:fashio/core/controllers/single_product_controller.dart';
import 'package:fashio/ui/shared/components/texts.dart';

import '../home/components/components.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final productDetailC = Get.put(SingleProductController());

  final RxInt _current = 0.obs;

  final RxString _selectedSize = ''.obs;

  final Rx<Color> _selectedColor = Colors.transparent.obs;

  final CarouselController _controller = CarouselController();

  Rx<bool> isCatVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    List<String> bannerImage = [
      productDetailC.productDetails.imgOne[0].url,
      productDetailC.productDetails.imgTwo[0].url,
      productDetailC.productDetails.imgThree[0].url,
      productDetailC.productDetails.imgFour[0].url,
      productDetailC.productDetails.imgFive[0].url,
    ];
    return Scaffold(
        body: NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.direction == ScrollDirection.forward) {
          isCatVisible.value = false;
        } else if (notification.direction == ScrollDirection.reverse) {
          isCatVisible.value = true;
        }
        return true;
      },
      child: Stack(
        children: [
          NestedScrollView(
              floatHeaderSlivers: true,
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      backgroundColor: AppColor.kWhite,
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: AppIcons.iconBack,
                      ),
                      leadingWidth: 20.sp,
                      title: HeadTitle(
                          text: productDetailC.productDetails!.productname,
                          fontSize: 14.sp),
                      actions: [
                        AppIcons.iconSearch,
                        AppSize.kSizedBox10w,
                        const Icon(
                          Icons.mic_none_outlined,
                          color: AppColor.kDarkGrey,
                        ),
                        AppSize.kSizedBox10w,
                        AppIcons.iconCart,
                        AppSize.kSizedBox10w
                      ],
                    ),
                  ],
              body: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: ListView(
                      padding: const EdgeInsets.all(0),
                      shrinkWrap: true,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // var list = List<String>.generate(
                            //     bannerImage.length, (i) => productDetailC.productDetails.[i].url);
                            // print(list);
                            // bannerImage.map(
                            //     (e) => productDetailC.productDetails.$de[0].url);
                            // final String imgPath = 'imgOne';
                            // print(productDetailC.productDetails.imgOne[0].url);
                            //  productDetailC.productDetails.product!.size!.length

                            // print(productDetailC.fullKitti);
                            // productDetailC.fetchProductDetails();
                            // print('---------------------${productDetailC.productDetails!.description}');
                          },
                          child: CustomBanner(
                              controller: _controller,
                              current: _current,
                              padding: 0,
                              imageList: bannerImage,
                              autoPlay: false,
                              subRow: Container()),
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
                        Padding(
                            padding: const EdgeInsets.all(0),
                            child: ListView(
                                padding: EdgeInsets.symmetric(horizontal: 4.sp),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  CustomRow(
                                    leading: Container(),
                                    trailing: Container(),
                                    title: productDetailC
                                        .productDetails.productname,
                                  ),
                                  AppSize.kSizedBox10h, AppSize.kSizedBox5h,

                                  RatingIndicator(
                                      rating: productDetailC
                                          .productDetails!.rating!.length
                                          .toDouble()),
                                  AppSize.kSizedBox10h,
                                  AppSize.kSizedBox5h,

                                  HeadTitle(
                                      text:
                                          ' ₹ ${productDetailC.productDetails!.offerPrice}',
                                      color: AppColor.kThemeBlue,
                                      fontSize: 16.sp),
                                  AppSize.kSizedBox10h,
                                  AppSize.kSizedBox5h,
                                  const HeadTitle(text: 'Select Size'),
                                  AppSize.kSizedBox10h,
                                  Row(
                                    children: List.generate(
                                        productDetailC
                                            .productDetails.size!.length,
                                        (index) => InkWell(
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                      AppColor.kWhite),
                                              onTap: () {
                                                // _selectedSize.value = sizeList[index];
                                                _selectedSize.value =
                                                    productDetailC
                                                        .productDetails
                                                        .size![index]
                                                        .size;
                                                //  productModel.product!.size![i].size.toString()
                                              },
                                              child: Obx(() => Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.sp),
                                                    child: CircleAvatar(
                                                      backgroundColor: _selectedSize
                                                                  .value ==
                                                              productDetailC
                                                                  .productDetails
                                                                  .size![index]
                                                                  .size
                                                          ? AppColor.kThemeBlue
                                                          : AppColor.kDarkWhite,
                                                      // index == _selectedItem.value
                                                      //     ? Colors.red
                                                      //     : AppColor.kWhite,
                                                      radius: 6.w,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            AppColor.kWhite,
                                                        child: HeadTitle(
                                                          text: productDetailC
                                                              .productDetails
                                                              .size![index]
                                                              .size,
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
                                    productDetailC.productDetails.color.length,
                                    (index) => InkWell(
                                        overlayColor: MaterialStateProperty.all(
                                            AppColor.kWhite),
                                        onTap: () {
                                          // Color color = Colors.primaries[index];
                                          // print(color);
                                          _selectedColor.value =
                                              colorList[index];

                                          // _selectedColor.value =
                                          //  productDetailC
                                          //     .productDetails.color[index].color
                                          //     .toRadixString(16);

                                          // _selectedColor.value = productDetailC.productDetails.color[index].color.toRadixString(16);
                                        },
                                        child: Obx(() => Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.sp),
                                            child: CircleAvatar(
                                              backgroundColor: colorList[index],
                                              radius: 20,
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      _selectedColor.value ==
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
                                          '${productDetailC.productDetails!.description}',
                                      color:
                                          AppColor.kLightGrey.withOpacity(.8)),
                                  AppSize.kSizedBox20h,
                                  TextBar(
                                    hPadding: 0,
                                    firstTitle: const HeadTitle(
                                      text: 'Review Product',
                                      fontSize: 14,
                                    ),
                                    secondTitle: GestureDetector(
                                      onTap: () {
                                        Get.toNamed('/review_product');
                                      },
                                      child: const HeadTitle(
                                        text: 'See More',
                                        fontSize: 13,
                                        color: AppColor.kThemeBlue,
                                      ),
                                    ),
                                  ),

                                  AppSize.kSizedBox5h,
                                  Row(children: [
                                    RatingIndicator(
                                      rating: double.parse(productDetailC
                                          .productDetails!
                                          .rating![0]
                                          .rateValue),
                                      itemSize: 12.sp,
                                    ),
                                    ReviewText(
                                      rating:
                                          '${productDetailC.productDetails!.rating![0].rateValue}',
                                      ratingCount: productDetailC
                                          .productDetails!.rating!.length
                                          .toString(),
                                    ),
                                  ]),
                                  AppSize.kSizedBox10h,
                                  ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    physics: const ScrollPhysics(),
                                    itemCount: 1,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20.sp,
                                                backgroundImage: NetworkImage(
                                                    productDetailC
                                                        .productDetails!
                                                        .rating![0]
                                                        .profilephoto
                                                    // 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'
                                                    ),
                                              ),
                                              AppSize.kSizedBox10w,
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  HeadTitle(
                                                    text: productDetailC
                                                        .productDetails!
                                                        .rating![0]
                                                        .userName,
                                                    fontSize: 12.sp,
                                                  ),
                                                  RatingIndicator(
                                                    rating: double.parse(
                                                        productDetailC
                                                            .productDetails!
                                                            .rating![0]
                                                            .rateValue),
                                                    itemSize: 12.sp,
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          AppSize.kSizedBox10h,
                                          SubTitle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.sp,
                                              color: AppColor.kLightGrey
                                                  .withOpacity(.8),
                                              text: productDetailC
                                                  .productDetails!
                                                  .rating![0]
                                                  .review
                                              // 'I completely love this site, found it on EBay at first now I just order directly through them...I am always complemented on my outfits I will be back for more...Thank you for having cute trendy',
                                              ),
                                          AppSize.kSizedBox10h,
                                          const SubTitle(
                                            text: 'December 18, 2019',
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'Poppins-Thin',
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  AppSize.kSizedBox20h,
                                  const TextBar(
                                      firstTitle: HeadTitle(
                                    text: 'You Might Also Like',
                                    fontSize: 14,
                                  )),

                                  //  TextBar(
                                  //   firstTitle: 'You Might Also Like',
                                  //   vPadding: 0,
                                  // ),
                                  AppSize.kSizedBox10h,
                                  SizedBox(
                                    height: 33.h,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 6,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                            top: 8,
                                            bottom: 8,
                                            right: 4,
                                          ),
                                          child: ProductCard(
                                              imgSrc: imgList[index],
                                              name:
                                                  'FS - Nike Air max 270 React new',
                                              currentPrize: '2999',
                                              originalPrize: '4999',
                                              offer: '24'),
                                        );
                                      },
                                    ),
                                  ),
                                ]))
                      ]))),
          Obx(() => Positioned(
              bottom: 5.h,
              left: 15.w,
              right: 15.w,
              child: isCatVisible.value
                  ?
                  
                   
                  
                  CustomButton(
                      color: AppColor.kDarkBlue,
                      text: 'Add to Cart',
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Item added to cart", // message
                          toastLength: Toast.LENGTH_SHORT, // length
                          gravity: ToastGravity.BOTTOM, 
                        );
                        Get.toNamed('/cart');
                      })
                  : Container()))
        ],
      ),
    ));
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
  final String title;
  const CustomRow({
    Key? key,
    required this.leading,
    required this.trailing,
    required this.title,
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
              text: title,
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
