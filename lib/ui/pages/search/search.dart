import 'package:fashio/ui/pages/account/account.dart';
import 'package:fashio/ui/pages/search/search_result.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .3,
        toolbarHeight: 10.h,
        backgroundColor: AppColor.kWhite,
        automaticallyImplyLeading: false,
        title: Container(
          width: 80.w,
          height: 6.h,
          color: Colors.white,
          child: Center(
              child: TextField(
                  style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.values[4],
                      color: AppColor.kblack.withOpacity(.6)),
                  autofocus: true,
                  // enabled: false,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColor.kThemeBlue.withOpacity(.4),
                          width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColor.kThemeBlue.withOpacity(.4),
                          width: 2.0),
                    ),
                    // enabledBorder: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.green, width: 2.0),
                    // ),
                    hintText: 'Search for something',
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.kThemeBlue.withOpacity(.8),
                      size: 20.sp,
                    ),
                    suffixIcon: Icon(
                      Icons.clear,
                      color: AppColor.kLightGrey.withOpacity(.8),
                      size: 20.sp,
                    ),
                  ))),
        ),
        actions: [
          IconButton(
            icon: AppIcons.iconMic,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: nameList.length,
        
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Get.to(SearchResult()),
            child: CustomListTile(
                leading: Text(
              nameList[index],
              style: TextStyle(
                  fontWeight: FontWeight.values[4], color: AppColor.kLightGrey),
            )),
          );
        },
      ),
      // appBar: AppBar(
      // The search area here
      // backgroundColor: AppColor.kWhite,
      // title: Container(
      //   width: double.infinity,
      //   height: 40,
      //   decoration: BoxDecoration(
      //       color: Colors.white, borderRadius: BorderRadius.circular(2.sp)),
      //   child: Center(
      //     child: TextField(
      //       decoration: InputDecoration(

      //           prefixIcon: const Icon(Icons.search),
      //           suffixIcon: IconButton(
      //             icon: const Icon(Icons.clear),
      //             onPressed: () {
      //               /* Clear the search field */
      //             },
      //           ),
      //           hintText: 'Search...',
      //           border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(2.sp))),
      //     ),
      //   ),
      // )),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: AppColor.kDarkBlue,
      //       floating: true,
      //       pinned: true,
      //       snap: false,
      //       title: const Text('Fashio.com',style: TextStyle(),),
      //       actions: [
      //         IconButton(
      //           icon: const Icon(Icons.shopping_cart),
      //           onPressed: () {},
      //         ),
      //       ],
      //       bottom: AppBar(
      //       backgroundColor: AppColor.kDarkBlue,

      //         automaticallyImplyLeading: false,
      //         title: Container(
      //           width: double.infinity,
      //           height: 40,
      //           color: Colors.white,
      //           child: const Center(
      //             child: TextField(
      //               decoration: InputDecoration(
      //                   hintText: 'Search for something',
      //                   prefixIcon: Icon(Icons.search),
      //                   suffixIcon: Icon(Icons.camera_alt)),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     // Other Sliver Widgets
      //     SliverList(
      //       delegate: SliverChildListDelegate([
      //         SizedBox(
      //           height: 400,
      //           child: const Center(
      //             child: Text(
      //               'This is an awesome shopping platform',
      //             ),
      //           ),
      //         ),
      //         Container(
      //           height: 1000,
      //           color: Colors.pink,
      //         ),
      //       ]),
      //     ),
      //   ],
      // ),
    );
  }
}
