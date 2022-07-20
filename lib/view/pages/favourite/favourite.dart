import 'package:fashio/controllers/fav_controller.dart';
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:fashio/view/shared/components/texts.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sizer/sizer.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  // final productDetailC = Get.put(FavController());
  final favDetails = Get.put(FavController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: CustomAppBar(
            leading: Center(
              child: GestureDetector(
                onTap: () {},
                child: const HeadTitle(
                  text: 'Favourite',
                  fontSize: 20,
                ),
              ),
            ),
            leadingWidth: 110,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Obx(() => GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                        mainAxisExtent: 33.h,
                      ),
                      itemCount: favDetails.favItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                            imgSrc: favDetails.favItems[index].img,
                            name: favDetails.favItems[index].title,
                            currentPrize:
                                favDetails.favItems[index].price == '0' ?
                                    favDetails.favItems[index].offerPrice :  favDetails.favItems[index].price.toString(),
                            originalPrize: favDetails.favItems[index].price.toString(),
                            offer: favDetails.favItems[index].offerPercent.toString(),
                            imgWidth: 40.w,
                            textWidth: 40.w,
                            delete: true,
                            onTapDelete: () {
                              favDetails.removeFav(favDetails.favItems[index].productId);
                            });
            },
          ),
        ),
      ),
    ));
  }
}
