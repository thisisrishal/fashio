import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../shared/components/texts.dart';
import '../home/components/components.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key}) : super(key: key);

  String dropdownvalue = nameList[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  style: TextStyle(
                      fontFamily: 'Poppins-SemiBold',
                      fontWeight: FontWeight.values[4],
                      color: AppColor.kblack.withOpacity(.6)),
                  // enabled: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColor.kDarkWhite.withOpacity(.6),
                          width: 2.0),
                    ),
                    hintText: 'Nike Air Max',
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColor.kThemeBlue.withOpacity(.8),
                      size: 20.sp,
                    ),
                  ))),
        ),
        actions: [
          IconButton(
            icon: AppIcons.iconSort,
            onPressed: () {},
          ),
          IconButton(
            icon: ChangeIconColor.iconFilter,
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
    
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const HeadTitle(
                  text: '145 Results',
                  fontSize: 14,
                  color: AppColor.kLightGrey,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        DropdownButton(
                            underline: Container(),
                            style: TextStyle(
                                fontFamily: 'Poppins-SemiBold',
                                fontWeight: FontWeight.values[4],
                                color: AppColor.kblack.withOpacity(.6)),
                            value: dropdownvalue,
                            items: nameList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (value) {
                              print(value);
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          GridView.builder(
            padding: const EdgeInsets.only(left: 10, right: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
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
                star: true,
                imgWidth: 40.w,
              );
            },
          ),
        ],
      ),
    );
  }
}
