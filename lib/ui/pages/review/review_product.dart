// import 'package:smart_select/smart_select.dart';
import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

class ReviewProductScreen extends StatelessWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);

//   @override
//   State<ReviewProductScreen> createState() => _ReviewProductScreenState();
// }

// class _ReviewProductScreenState extends State<ReviewProductScreen> {
//   int tag = 1;
//   // late List<S2Choice> choiceItems ;
//   String value = 'flutter';
// // List<S2Choice<String>> options = [
// //   S2Choice<String>(value: 'ion', title: 'Ionic'),
// //   S2Choice<String>(value: 'flu', title: 'Flutter'),
// //   S2Choice<String>(value: 'rea', title: 'React Native'),
// // ];

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
                    // physics: const BouncingScrollPhysics(),
                    // onTap: (value) => print(value),
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
              Expanded(
                child: TabBarView(children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
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
                              children: [
                                HeadTitle(
                                  text: 'Bella Hadid',
                                  fontSize: 12.sp,
                                ),
                                RatingBar.builder(
                                  // rating: _userRating,

                                  itemBuilder: (context, index) =>
                                      AppIcons.iconStar,
                                  itemPadding:
                                      const EdgeInsets.only(right: 4.0),
                                  itemCount: 5,
                                  initialRating: 1,
                                  minRating: 1,
                                  itemSize: 12.sp,
                                  unratedColor: Colors.amber.withAlpha(50),
                                  glowColor: AppColor.kLightGrey,
                                  direction: Axis.horizontal,
                                  updateOnDrag: true,
                                  allowHalfRating: true,

                                  onRatingUpdate: (double value) {
                                    // print(value);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        AppSize.kSizedBox10h,
                        SubTitle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            text:
                                'I completely love this site, found it on EBay at first now I just order directly through them...I am always complemented on my outfits I will be back for more...Thank you for having cute trendy',
                            fontFamily: 'Poppins-Thin'),
                        AppSize.kSizedBox10h,
                        const SubTitle(
                          text: 'December 18, 2019',
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Poppins-Thin',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.green,
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.yellow,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  ),
                ]),
              ),
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
