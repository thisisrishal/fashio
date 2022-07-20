import 'package:fashio/view/shared/components/custom_button.dart';
import 'package:fashio/view/shared/components/rating.dart';

import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ReviewProductScreen extends StatelessWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
              leading: AppIcons.iconBack, leadingWidth: 20, title: '5 Reviews'),
        ),
        body: DefaultTabController(
          length: 6,
          initialIndex: 0,
          child: Column(
            children: [
              SizedBox(
                child: TabBar(
                    indicator: const BoxDecoration(),
                    padding: EdgeInsets.only(top: 12.sp),
                    indicatorPadding: EdgeInsets.zero,
                    // automaticIndicatorColorAdjustment: false,
                    isScrollable: true,
                    labelColor: AppColor.kDarkBlue,
                    unselectedLabelColor: Colors.grey,
                    labelPadding: EdgeInsets.only(
                      left: 12.sp,
                    ),
                    tabs: starList),
              ),
              const Expanded(
                child: TabBarView(children: [
                  ReviewDetail(itemCount: 10),
                  ReviewDetail(itemCount: 5),
                  ReviewDetail(itemCount: 4),
                  ReviewDetail(itemCount: 2),
                  ReviewDetail(itemCount: 1),
                  ReviewDetail(itemCount: 0),
                  
                ]),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/write_review');
                
                },
                child: CustomButton(color: AppColor.kDarkBlue, text: 'Write a Review')),
            ],
          ),
        )

        //       body: ListView(
        //         padding: EdgeInsets.all(10.sp),
        //         children: [

        //           // SizedBox(
        //           //     height: 6.h,
        // //               child: SmartSelect<String>.single(
        // //   title: 'Frameworks',
        // //   value: 'value',

        // //   choiceItems: options,
        // //   onChange: (state) => setState(() => value = state.value)
        // // )
        //               //  ListView.builder(
        //               //   itemCount: 6,
        //               //   shrinkWrap: true,
        //               //   scrollDirection: Axis.horizontal,
        //               //   itemBuilder: (BuildContext context, int index) {
        //               //     return Padding(
        //               //       padding: EdgeInsets.only(right: 8.sp),
        //               //       child: Container(
        //               //           decoration: BoxDecoration(
        //               //               color: const Color.fromARGB(116, 64, 191, 255),
        //               //               borderRadius: BorderRadius.circular(3.sp)),
        //               //           padding: EdgeInsets.all(6.sp),
        //               //           child: const Center(child: SubTitle(text: 'All Review',color: AppColor.kDarkBlue,))),
        //               //     );
        //               //   },
        //               // ),
        //               // ),
        //               // SizedBox(
        //               //   height: 100,
        //               //   width: 200,
        //               //   child: ListView.builder(
        //               //     itemCount: 1,
        //               //     itemBuilder: (BuildContext context, int index) {
        //               //       return Column(
        //               //         children: [
        //               //           Row(
        //               //             children: [
        //               //               ClipRRect(
        //               //                 borderRadius: BorderRadius.circular(8.0),
        //               //                 child: Image.network(
        //               //                   'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        //               //                   width: 110.0,
        //               //                   height: 110.0,
        //               //                   fit: BoxFit.fill,
        //               //                 ),
        //               //               ),
        //               //             ],
        //               //           ),
        //               //           Row()
        //               //         ],
        //               //       );
        //               //     },
        //               //   ),
        //               // ),
        //         ],
        // )
        );
  }
}

class ReviewDetail extends StatelessWidget {
  final int itemCount;
  final double? padding;

  const ReviewDetail({
    Key? key,
    required this.itemCount,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(padding ?? 14.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundImage: const NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
                  ),
                  AppSize.kSizedBox10w,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadTitle(
                        text: 'Bella Hadid',
                        fontSize: 12.sp,
                      ),
                      RatingIndicator(
                        rating: 4.5,
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
                color: AppColor.kLightGrey.withOpacity(.8),
                text:
                    'I completely love this site, found it on EBay at first now I just order directly through them...I am always complemented on my outfits I will be back for more...Thank you for having cute trendy',
              ),
              AppSize.kSizedBox10h,
              const SubTitle(
                text: 'December 18, 2019',
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins-Thin',
              ),
            ],
          ),
        );
      },
    );
  }
}
