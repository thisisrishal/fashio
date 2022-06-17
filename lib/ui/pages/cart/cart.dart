// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/ui/pages/home/components/components.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              leading: Center(
                  child: HeadTitle(
                text: 'Your Cart',
                fontSize: 20,
              )),
              leadingWidth: 110,
            )),
        body: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(2.5.w),
                height: 22.h,
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.kLightGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: AppColor.kThemeBlue,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        AppSize.kSizedBox5w,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CardText(
                                text:
                                    'Nike Air Zoom Pegasus 36 miami - dummy dummy dummy ',
                                fontSize: 14,
                                width: 40.w),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColor.kDarkWhite,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  )),
                              padding: EdgeInsets.all(.8.w),
                              child: Row(
                                children: [
                                  HeadTitle(
                                    text: 'Size  L',
                                    fontSize: 12,
                                  ),
                                  AppSize.kSizedBox10w,
                                  AppIcons.icondown
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          child: HeadTitle(
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
          ),
        ));
  }
}
