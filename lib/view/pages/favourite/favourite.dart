
import 'package:fashio/view/constants/appConstants.dart';
import 'package:fashio/view/pages/home/components/components.dart';
import 'package:fashio/view/shared/components/texts.dart';

 import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar:  PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: CustomAppBar(
                  leading : Center(child: HeadTitle(text: 'Favourite',fontSize: 20,)),
                  leadingWidth: 110,
                  
                  

                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: GridView.builder(
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
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    imgSrc: imgList[index],
                    name: 'FS - Nike Air max 270 React new',
                    currentPrize: '2999',
                    originalPrize: '4999',
                    offer: '24',
                    imgWidth: 40.w,
                    delete: true,
                    textWidth: 40.w,
                  );
                },
              ),
            )));
  }
}
