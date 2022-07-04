// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/configs/appConstants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:fashio/ui/pages/home/components/components.dart';
import 'package:fashio/ui/shared/components/texts.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  String dropdownSize = sizeList[0];
  Color dropdownColor = colorList[0];
  String dropdownQty = qtyList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 20.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: AppColor.kThemeBlue,
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://i.pinimg.com/564x/da/15/b5/da15b5675e303eb28f881dfb5351f08c.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        AppSize.kSizedBox5w,
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.sp,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CardText(
                                  text:
                                      'Awesome 2016 Women High Quality Suit Set Office Ladies Work Wear Women ',
                                  fontSize: 14,
                                  width: 55.w),
                              AppSize.kSizedBox10h,
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 6.sp, right: 6.sp),
                                    decoration: BoxDecoration(
                                        color:
                                            AppColor.kLightBlue.withOpacity(.5),
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
                                  AppSize.kSizedBox10w,
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 2.sp, right: 6.sp),
                                    decoration: BoxDecoration(
                                        color:
                                            AppColor.kLightBlue.withOpacity(.5),
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
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                ],
                              ),
                              AppSize.kSizedBox10w,
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppSize.kSizedBox10h,
                    Row(
                      children: [
                        // Container(
                        //   width: 20.w,
                        //   padding: EdgeInsets.only(left: 2.sp, right: 6.sp),
                        //   decoration: BoxDecoration(
                        //       // color: AppColor.kLightBlue.withOpacity(.5),
                        //       border: Border.all(
                        //           color: AppColor.kLightBlue.withOpacity(.5)),
                        //       borderRadius: customBorderRadius4),
                        //   child: DropdownButton(
                        //       icon: AppIcons.icondown,
                        //       isDense: true,
                        //       elevation: 0,
                        //       style: TextStyle(
                        //         fontSize: 10.sp,
                        //         fontWeight: FontWeight.bold,
                        //         color: AppColor.kblack,
                        //       ),
                        //       underline: Container(),
                        //       value: dropdownQty,
                        //       items: qtyList
                        //           .map((e) => DropdownMenuItem(
                        //                 enabled: true,
                        //                 value: e,
                        //                 child: Padding(
                        //                   padding: EdgeInsets.symmetric(
                        //                       horizontal: 4.0, vertical: 4.sp),
                        //                   child: Text('Qty: $e'),
                        //                 ),
                        //               ))
                        //           .toList(),
                        //       onChanged: (String? newValue) {
                        //         dropdownQty = newValue!;
                        //       }),
                        // ),
                        Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              isExpanded: true,
                              hint: Row(
                                children: const [
                                  Icon(
                                    Icons.list,
                                    size: 16,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: qtyList
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Row(
                                          children: [
                                            Text(
                                              item,
                                              style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.kDarkBlue,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              value: dropdownQty,
                              onChanged: (value) {
                                // setState(() {
                                dropdownQty = value as String;
                                // });
                              },
                              icon: AppIcons.icondown,
                              iconSize: 14,
                              iconEnabledColor: Colors.yellow,
                              iconDisabledColor: Colors.grey,
                              buttonHeight: 7.w,
                              buttonWidth: 20.w,
                              buttonPadding:
                                  const EdgeInsets.only(left: 14, right: 14),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  4.sp,
                                ),
                                border: Border.all(
                                  color: AppColor.kLightGrey.withOpacity(.5),
                                ),
                                color: AppColor.kWhite,
                              ),
                              buttonElevation: 2,
                              // itemHeight: 10,
                              itemPadding:
                                  const EdgeInsets.only(left: 14, right: 14),

                              dropdownPadding: null,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.sp),
                                // color: AppColor.kDarkBluePrimary,
                              ),
                              dropdownElevation: 8,
                              scrollbarRadius: const Radius.circular(40),
                              scrollbarThickness: 6,
                              scrollbarAlwaysShow: true,
                              offset: const Offset(0, 0),
                            ),
                          ),
                        ),
                        AppSize.kSizedBox10w,
                        LineThroughText(text: '534,33', fontSize: 12),
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
          ),
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
          fontSize: 12.sp,
        ));
  }
}
