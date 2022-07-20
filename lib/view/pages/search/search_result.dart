import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/controllers/search_controller.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';

import '../../../controllers/cart_controller.dart';

class SearchResult extends StatelessWidget {
   SearchResult({Key? key}) : super(key: key);

 final HomeScreenController  homeScreenC = Get.find();
 final CartController  cartController = Get.find();


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(() {
        return searchController.searchList.isNotEmpty
            ? Padding(
                padding: EdgeInsets.only(top: 10.sp),
                child: GridView.builder(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 33.h,
                  ),
                  itemCount: searchController.searchList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: 
                      ()async{
                       await productDetailC.fetchProductDetails(
                                    homeScreenC.flashSaleList.value[index].sId
                                        .toString());
                                cartController.fetchCartProducts();

                                Get.toNamed('/product_detail');},
                              
                      
                      
                      child: ProductCard(
                        imgSrc: searchController.searchList[index].imgOne[0].url,
                        name: searchController.searchList[index].productname,
                        currentPrize: searchController
                                    .searchList[index].offerPrice
                                    .toString() ==
                                '0'
                            ? searchController.searchList[index].price.toString()
                            : searchController.searchList[index].offerPrice
                                .toString(),
                        originalPrize:
                            searchController.searchList[index].price.toString(),
                        offer: searchController.searchList[index].discount
                            .toString(),
                        star: true,
                        ratingCount: double.parse(searchController
                            .searchList[index].rating.length
                            .toString()),
                        imgWidth: 40.w,
                      ),
                    );
                  },
                ))
            : Container(
                color: Colors.red,
                child: const Center(child: Text('No Result Found')),
              );
      }),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.w,
      height: 6.h,
      color: Colors.white,
      child: Row(
        children: [
          Center(
            child: TextField(
              style: TextStyle(
                  fontFamily: 'Poppins-SemiBold',
                  fontWeight: FontWeight.values[4],
                  color: AppColor.kblack.withOpacity(.6)),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.kThemeBlue.withOpacity(.4), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColor.kLightGrey.withOpacity(.1), width: 2.0),
                ),
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
              ),
              onChanged: (val) {
                (val.isEmpty)
                    ? searchController.isSearching.value = false
                    : searchController.isSearching.value = true;
                searchController.search(val);
              },
            ),
          ),
          IconButton(
            icon: AppIcons.iconSort,
            onPressed: () {
              // Get.toNamed('/search_sort');
            },
          ),
          IconButton(
            icon: ChangeIconColor.iconFilter,
            onPressed: () {
              // Get.toNamed('/filter');
            },
          ),
        ],
      ),
    );
  }
}

//?? Filter Bar with search and filter
class FilterSearchBar extends StatelessWidget {
  FilterSearchBar({
    Key? key,
  }) : super(key: key);

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: .3,
      toolbarHeight: 10.h,
      backgroundColor: AppColor.kWhite,
      automaticallyImplyLeading: false,
      title: Container(
        width: 70.w,
        height: 6.h,
        color: Colors.white,
        child: Center(
            child: TextField(
          controller: _controller,
          style: TextStyle(
              fontFamily: 'Poppins-SemiBold',
              fontWeight: FontWeight.values[4],
              color: AppColor.kblack.withOpacity(.6)),
          textInputAction: TextInputAction.search,
          onSubmitted: (val) {
            searchController.isKeyboard.value = false;
          },
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColor.kThemeBlue.withOpacity(.4), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColor.kLightGrey.withOpacity(.1), width: 2.0),
            ),
            hintText: 'Search for something',
            hintStyle: TextStyle(
                fontFamily: 'Poppins-SemiBold',
                fontWeight: FontWeight.values[4],
                color: AppColor.kblack.withOpacity(.6)),
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              color: AppColor.kThemeBlue.withOpacity(.8),
              size: 20.sp,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                _controller.clear();
              },
              icon: Icon(
                Icons.clear,
                color: AppColor.kLightGrey.withOpacity(.8),
                size: 20.sp,
              ),
            ),
          ),
          onChanged: (val) {
            (val.isEmpty)
                ? searchController.isSearching.value = false
                : searchController.isSearching.value = true;
            searchController.search(val);
          },
        )),
      ),
      actions: [
        IconButton(
          icon: AppIcons.iconSort,
          onPressed: () {
            // Get.toNamed('/search_sort');
          },
        ),
        IconButton(
          icon: ChangeIconColor.iconFilter,
          onPressed: () {
            // Get.toNamed('/filter');
          },
        ),
      ],
    );
  }
}
