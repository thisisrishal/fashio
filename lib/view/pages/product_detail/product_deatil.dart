// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/controllers/cart_controller.dart';
import 'package:fashio/controllers/single_product_controller.dart';
import 'package:fashio/view/shared/components/custom_button.dart';
import 'package:fashio/view/shared/components/rating.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';
import '../home/components/components.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final productDetailC = Get.put(SingleProductController());
  final cartC = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    List<String> bannerImage = [
      productDetailC.productDetails.imgOne[0].url,
      productDetailC.productDetails.imgTwo[0].url,
      productDetailC.productDetails.imgThree[0].url,
      productDetailC.productDetails.imgFour[0].url,
      productDetailC.productDetails.imgFive[0].url,
    ];
    return Obx(() => Scaffold(
        appBar: AppBar(
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
        body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            if (notification.direction == ScrollDirection.forward) {
              productDetailC.isCatVisible.value = false;
            } else if (notification.direction == ScrollDirection.reverse) {
              productDetailC.isCatVisible.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CustomBanner(
                        controller: productDetailC.controller,
                        current: productDetailC.current,
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
                          onTap: () {},
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // ignore: unrelated_type_equality_checks
                              color: productDetailC.current == entry.key
                                  ? AppColor.kThemeBlue
                                  : AppColor.kDarkWhite,
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                  Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: ListView(
                          padding: EdgeInsets.symmetric(horizontal: 2.sp),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            CustomRow(
                              leading: Container(),
                              trailing: Container(),
                              title: productDetailC.productDetails.productname,
                            ),
                            AppSize.kSizedBox10h,
                            AppSize.kSizedBox5h,
                            RatingIndicator(
                                rating: productDetailC
                                    .productDetails!.rating!.length
                                    .toDouble()),
                            AppSize.kSizedBox10h,
                            AppSize.kSizedBox5h,
                            HeadTitle(
                                text: productDetailC
                                            .productDetails.offerPrice ==
                                        0
                                    ? ' ₹ ${productDetailC.productDetails.price} '
                                    : ' ₹ ${productDetailC.productDetails!.offerPrice}',
                                color: AppColor.kThemeBlue,
                                fontSize: 16.sp),
                            AppSize.kSizedBox10h,
                            AppSize.kSizedBox5h,
                            const HeadTitle(text: 'Select Size'),
                            AppSize.kSizedBox10h,
                            Row(
                              children: List.generate(
                                  productDetailC.productDetails.size!.length,
                                  (index) => InkWell(
                                        overlayColor: MaterialStateProperty.all(
                                            AppColor.kWhite),
                                        onTap: () {
                                          productDetailC.selectedSize.value =
                                              productDetailC.productDetails
                                                  .size![index].size;
                                        },
                                        child: Obx(() => Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.sp),
                                              child: CircleAvatar(
                                                backgroundColor: productDetailC
                                                            .selectedSize
                                                            .value ==
                                                        productDetailC
                                                            .productDetails
                                                            .size![index]
                                                            .size
                                                    ? AppColor.kThemeBlue
                                                    : AppColor.kDarkWhite,
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
                                    productDetailC.selectedColor.value =
                                        colorList[index];
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.sp),
                                    child: CircleAvatar(
                                      backgroundColor: Color(int.parse(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          '0xff' +
                                              productDetailC.productDetails
                                                  .color[index].color)),
                                      radius: 20,
                                      child: CircleAvatar(
                                          backgroundColor: productDetailC
                                                      .selectedColor.value ==
                                                  colorList[index]
                                              ? AppColor.kWhite
                                              : Color(int.parse(
                                                  // ignore: prefer_interpolation_to_compose_strings
                                                  '0xff' +
                                                      productDetailC
                                                          .productDetails
                                                          .color[index]
                                                          .color)),
                                          radius: 6.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AppSize.kSizedBox20h,
                            const HeadTitle(text: 'Specifications'),
                            AppSize.kSizedBox10h,
                            SubTitle(
                                text:
                                    '${productDetailC.productDetails!.description}',
                                color: AppColor.kLightGrey.withOpacity(.8)),
                            AppSize.kSizedBox20h,
                            TextBar(
                              hPadding: 0,
                              firstTitle: const HeadTitle(
                                  text: 'Review Product', fontSize: 14),
                              secondTitle: GestureDetector(
                                  onTap: () {
                                    // Get.toNamed('/review_product');
                                  },
                                  child: productDetailC
                                              .productDetails!.rating.length !=
                                          0
                                      ? const HeadTitle(
                                          text: 'See More',
                                          fontSize: 13,
                                          color: AppColor.kThemeBlue,
                                        )
                                      : Container()),
                            ),
                            Container(
                                child: productDetailC
                                            .productDetails!.rating.length !=
                                        0
                                    ? Column(
                                        children: [
                                          AppSize.kSizedBox5h,
                                          Row(children: [
                                            RatingIndicator(
                                              rating: double.parse(
                                                  productDetailC.productDetails!
                                                      .rating![0].rateValue),
                                              itemSize: 12.sp,
                                            ),
                                            ReviewText(
                                              rating:
                                                  '${productDetailC.productDetails!.rating![0].rateValue}',
                                              ratingCount: productDetailC
                                                  .productDetails!
                                                  .rating!
                                                  .length
                                                  .toString(),
                                            ),
                                          ]),
                                          AppSize.kSizedBox10h,
                                          Column(
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
                                                                    .rating
                                                                    .length !=
                                                                0
                                                            ? productDetailC
                                                                .productDetails!
                                                                .rating![0]
                                                                .profilephoto
                                                            : 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                                                  ),
                                                  AppSize.kSizedBox10w,
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
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
                                                      .review),
                                              AppSize.kSizedBox10h,
                                              const SubTitle(
                                                text: 'December 18, 2019',
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'Poppins-Thin',
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            AppSize.kSizedBox20h,
                                            const SubTitle(
                                              text:
                                                  'Be the first one to review',
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Poppins-Thin',
                                            ),
                                            AppSize.kSizedBox10h,
                                            SizedBox(
                                              width: 40.w,
                                              height: 5.h,
                                              child: CustomButton(
                                                  color: AppColor.blueGrey,
                                                  text: 'Write a Review',
                                                  onPressed: () {
                                                    Get.toNamed(
                                                        '/review_product');
                                                  }),
                                            ),
                                          ])),
                            AppSize.kSizedBox20h,
                            const HeadTitle(text: 'You Might Also Like'),
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
                          ])),
                ],
              ),
              Positioned(
                  bottom: 5.h,
                  left: 15.w,
                  right: 15.w,
                  child: productDetailC.isCatVisible.value
                      ? cartC.isCartItem(productDetailC.productDetails!.id)
                          ? CustomButton(
                              color: AppColor.kDarkBlue,
                              text: 'Add to Cart',
                              onPressed: () {
                                if (cartC.userId.isNotEmpty &&
                                    cartC.productId.isNotEmpty &&
                                    cartC.productImage.isNotEmpty &&
                                    cartC.price.isNotEmpty &&
                                    cartC.color.isNotEmpty &&
                                    cartC.size.isNotEmpty) {
                                  print('not ok');
                                } else {
                                  print('Something went wrong');
                                }

                                // productDetailC.
                                Fluttertoast.showToast(
                                  msg: "Item added to cart", // message
                                  toastLength: Toast.LENGTH_SHORT, // length
                                  gravity: ToastGravity.BOTTOM,
                                );
                                Get.toNamed('/cart');
                              })
                          : CustomButton(
                              color: AppColor.kDarkBlue,
                              text: 'Go to Cart',
                              onPressed: () {
                                Get.toNamed('/cart');
                              })
                      : Container())
            ],
          ),
        )));
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
