// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/configs/appConstants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fashio/core/controllers/cart_controller.dart';
import 'package:fashio/ui/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/ui/pages/home/components/components.dart';
import 'package:fashio/ui/shared/components/texts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartController = Get.put(CartController());

  String dropdownSize = sizeList[0];
  Color dropdownColor = colorList[0];
  String dropdownQty = qtyList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              leading: GestureDetector(
                onTap: () {
                  cartController.fetchCartProducts();
                },
                child: const Center(
                    child: HeadTitle(
                  text: 'Your Cart',
                  fontSize: 20,
                )),
              ),
              leadingWidth: 110,
            )),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: 
           cartController.cartProducts.value.isNotEmpty
                ?
          
          
          Column(
            
            children: [
              
              Container(
                padding: EdgeInsets.only(top: 2.5.w),
                height: 22.h,
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.kLightGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Column(
                          children: [
                            Container(
                              width: 20.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                  color: AppColor.kThemeBlue,
                                  borderRadius: customBorderRadius4,
                                  image: DecorationImage(
                                      image: NetworkImage(cartController
                                          .cartProducts.value[0].productImage),
                                      fit: BoxFit.cover)),
                            ),
                            AppSize.kSizedBox10h,
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: 6.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.horizontal(
                                          left: Radius.circular(4.sp)),
                                      color:
                                          AppColor.kLightGrey.withOpacity(.3),
                                    ),
                                    child: const Center(child: Text('-')),
                                  ),
                                  //custom elevated button

                                  Container(
                                      width: 8.w,
                                      height: 18.sp,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: AppColor.kLightGrey
                                                .withOpacity(.3),
                                          )),
                                      child:  Center(child: Text(cartController.cartProducts.value[0].quantity.toString()))),
                                  Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.kLightGrey
                                              .withOpacity(.3),
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(4.sp))),
                                      width: 6.w,
                                      child: const Center(child: Text('+'))),
                                  AppSize.kSizedBox10w,
                                ],
                              ),
                            ),
                          ],
                        ),
                        AppSize.kSizedBox5w,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CardText(
                                    text: cartController
                                        .cartProducts.value[0].productname,
                                    fontSize: 13.sp,
                                    width: 55.w),
                                AppIcons.iconDelete
                              ],
                            ),
                            AppSize.kSizedBox10h,
                            AppSize.kSizedBox5h,
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 6.sp, right: 6.sp),
                                        decoration: BoxDecoration(
                                            color: AppColor.kLightBlue
                                                .withOpacity(.5),
                                            borderRadius:
                                                BorderRadius.circular(4.sp)),
                                        child: DropdownButton(
                                            icon: AppIcons.icondown,
                                            isDense: true,
                                            elevation: 0,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.kblack,
                                            ),
                                            underline: Container(),
                                            value: dropdownSize,
                                            items: sizeList
                                                .map((e) => DropdownMenuItem(
                                                      enabled: true,
                                                      value: e,
                                                      child: Text('Size  $e'),
                                                    ))
                                                .toList(),
                                            onChanged: (String? newValue) {
                                              dropdownSize = newValue!;
                                            }),
                                      ),
                                    ),
                                    AppSize.kSizedBox10h,
                                    LineThroughText(
                                        text:
                                            '₹ ${cartController.cartProducts.value[0].mrp}',
                                        fontSize: 14.sp),
                                  ],
                                ),
                                AppSize.kSizedBox10w,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      margin: const EdgeInsets.all(0),
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 2.sp, right: 6.sp),
                                        decoration: BoxDecoration(
                                            color: AppColor.kLightBlue
                                                .withOpacity(.5),
                                            borderRadius: customBorderRadius4),
                                        child: DropdownButton(
                                            icon: AppIcons.icondown,
                                            isDense: true,
                                            elevation: 0,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.kblack,
                                            ),
                                            underline: Container(),
                                            value: dropdownColor,
                                            items: colorList
                                                .map((e) => DropdownMenuItem(
                                                      enabled: true,
                                                      value: e,
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 4.0,
                                                                vertical: 4.sp),
                                                        child: CircleAvatar(
                                                          radius: 10,
                                                          backgroundColor: e,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (Color? newValue) {
                                              dropdownColor = newValue!;
                                            }),
                                      ),
                                    ),
                                    AppSize.kSizedBox10h,
                                    // Text('')
                                    HeadTitle(
                                        text:
                                            '₹ ${cartController.cartProducts.value[0].totalPrice}',
                                        fontSize: 14.sp)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6.sp),
                          child: Container(
                            padding: EdgeInsets.all(6.sp),
                            width: 36.w,
                            height: 28.sp,
                            decoration: BoxDecoration(
                                color: AppColor.kLightBlue,
                                borderRadius: customBorderRadius4),
                            child: Row(
                              children: [
                                AppIcons.saveForLater,
                                AppSize.kSizedBox5w,
                                const SubTitle(
                                  text: 'Save for Later',
                                  color: AppColor.kDarkBlue,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.sp),
                          child: Container(
                            padding: EdgeInsets.only(left: 6.sp),
                            width: 36.w,
                            height: 28.sp,
                            decoration: BoxDecoration(
                                color: AppColor.kLightBlue,
                                borderRadius: customBorderRadius4),
                            child: Row(
                              children: [
                                AppIcons.buyThisNow,
                                AppSize.kSizedBox5w,
                                const SubTitle(
                                  text: 'Buy this Now',
                                  color: AppColor.kDarkBlue,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              AppSize.kSizedBox10h,
              AppSize.kSizedBox5h,
              Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 15.w,
                        width: 92.w,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Coupon Code',
                              labelStyle: TextStyle(
                                  color: AppColor.kDarkGrey, fontSize: 14)),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 15.w,
                          width: 23.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColor.kThemeBlue,
                            borderRadius: BorderRadius.only(
                                // bottomLeft:
                                // Radius.circular(4),
                                bottomRight: Radius.circular(4),
                                topRight: Radius.circular(4)),
                          ),
                          child: const HeadTitle(
                            text: 'Apply',
                            color: AppColor.kWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              AppSize.kSizedBox10h,
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.kLightGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrizeListRow(
                            leading: SubTitle(
                              text: 'Items(3)',
                              color: AppColor.kDarkBlue,
                              fontSize: 10.sp,
                            ),
                            trailing: SubTitle(
                              text: '₹598.86',
                              color: AppColor.kDarkBlue,
                              fontSize: 10.sp,
                            ),
                          ),
                          AppSize.kSizedBox10h,
                          PrizeListRow(
                            leading: SubTitle(
                              text: 'Discount',
                              color: AppColor.kDarkBlue,
                              fontSize: 10.sp,
                            ),
                            trailing: SubTitle(
                              text: '-₹40.00',
                              color: AppColor.kGreen,
                              fontSize: 10.sp,
                            ),
                          ),
                          AppSize.kSizedBox10h,
                          PrizeListRow(
                            leading: SubTitle(
                              text: 'Delivery Charges',
                              color: AppColor.kDarkBlue,
                              fontSize: 10.sp,
                            ),
                            trailing: SubTitle(
                              text: '₹60',
                              color: AppColor.kDarkBlue,
                              fontSize: 10.sp,
                            ),
                          ),
                          AppSize.kSizedBox10h,
                          const DottedLine(
                            direction: Axis.horizontal,
                            // lineLength: double.infinity,
                            // lineThickness: 1.0,
                            // dashLength: 4.0,
                            dashColor: AppColor.kDarkWhite,
                            // dashGradient: [Colors.red, Colors.blue],
                            // dashRadius: 0.0,
                            // dashGapLength: 4.0,
                            // dashGapColor: Colors.transparent,
                            // dashGapGradient: [Colors.red, Colors.blue],
                            // dashGapRadius: 0.0,
                          ),
                          AppSize.kSizedBox10h,
                          PrizeListRow(
                            leading: HeadTitle(
                              text: 'Total Prize',
                              color: AppColor.kDarkBlue,
                              fontSize: 12.sp,
                            ),
                            trailing: HeadTitle(
                              text: '₹766.86',
                              color: AppColor.kDarkBlue,
                              fontSize: 12.sp,
                              // fontWeight: FontWeight.w900
                            ),
                          ),
                          AppSize.kSizedBox20h,
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: HeadTitle(
                              text: 'You will save ₹40.00 on this order',
                              color: AppColor.kGreen,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5.5.h,
                      child: Container(
                        color: AppColor.kDarkGrey.withOpacity(.8),
                        height: 1,
                        width: 92.w,
                      )),
                ],
              ),
              AppSize.kSizedBox10h,
              //checkout button
              const CustomElevatedButton(text: 'Checkout'),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeadTitle(
                text: 'No items in cart',
                color: AppColor.kDarkBlue,
                fontSize: 14,
              ),
              AppSize.kSizedBox10h,
              const SubTitle(
                text: 'Start shopping to add items to cart',
                color: AppColor.kDarkBlue,
                fontSize: 14,
              ),
              AppSize.kSizedBox10h,
              CustomButton(color: AppColor.kDarkBlue, text: 'Continue Shopping',onPressed: (){}),
            ],
          )
        ));
  }
}

class LineThroughText extends StatelessWidget {
  String text;
  double fontSize;
  LineThroughText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.lineThrough,
          color: AppColor.kLightGrey,
          fontSize: fontSize,
        ));
  }
}
