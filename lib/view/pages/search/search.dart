import 'package:fashio/view/pages/account/account.dart';
import 'package:fashio/view/pages/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';

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
        title: const SearchBarCustom(),
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
    );
  }
}
