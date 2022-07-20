import 'package:fashio/controllers/home_screen_controller.dart';
import 'package:fashio/view/pages/account/account.dart';
import 'package:fashio/view/pages/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/view/constants/appConstants.dart';

import 'components/searchBar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    searchController.isSearching.value = false;
  }

  final homeController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(10.h),
            child: const SearchingAppBar()),
        body: searchController.isSearching.value
            ? SearchResult()
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.categoryList.value.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Get.offNamed('/categoryDetails',
                        arguments: homeController.categoryList.value[index]),
                    child: CustomListTile(
                        leading: Text(
                      homeController.categoryList.value[index].subcategoryname,
                      style: TextStyle(
                          fontWeight: FontWeight.values[4],
                          color: AppColor.kLightGrey),
                    )),
                  );
                },
              ),
      );
    });
  }
}
