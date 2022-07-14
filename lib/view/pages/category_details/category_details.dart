import 'package:fashio/controllers/all_products_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/home_screen_controller.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({Key? key}) : super(key: key);

  final homeScreenC = Get.put(HomeScreenController());

  final allProductsController = Get.put(AllProductsController());

  var product = Get.arguments;

  // allProductsController.getCategoryDetails('Men');
  @override
  Widget build(BuildContext context) {
    allProductsController.getAllProductDetails();
    allProductsController.getCategoryDetails(product.subcategoryname);
    
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kWhite,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppIcons.iconBack,
          ),
          leadingWidth: 20.sp,
          title: HeadTitle(text: product.subcategoryname, fontSize: 14.sp),
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
        body: Obx(() => AnimationLimiter(
              child: GridView.builder(
                padding: const EdgeInsets.only(left: 10, right: 10),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 5.0,
                  mainAxisExtent: 33.h,
                ),
                itemCount: allProductsController.categoryDetials.value.isEmpty
                    ? 0
                    : allProductsController.categoryDetials.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 8.sp),
                    child: ProductCard(
                      imgSrc: allProductsController
                          .categoryDetials.value[index].imgFive[0].url
                          .toString(),
                      name: homeScreenC.flashSaleList.value[index].productname
                          .toString(),
                      currentPrize:
                          homeScreenC.flashSaleList.value[index].offerPrice == 0
                              ? homeScreenC.flashSaleList.value[index].price
                                  .toString()
                              : homeScreenC
                                  .flashSaleList.value[index].offerPrice
                                  .toString(),
                      originalPrize: homeScreenC
                          .flashSaleList.value[index].price
                          .toString(),
                      offer: homeScreenC.flashSaleList.value[index].discount
                          .toString(),
                      // offer: '24',
                      star: true,
                      ratingCount:
                          homeScreenC.flashSaleList.value[index].rating!.isEmpty
                              ? 1
                              : double.parse(homeScreenC.flashSaleList
                                  .value[index].rating![0].rateValue
                                  .toString()),

                      imgWidth: 40.w,
                    ),
                  );
                },
              ),
            )));
  }
}
