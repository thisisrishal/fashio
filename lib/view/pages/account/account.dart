// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/controllers/address_controller.dart';
import 'package:fashio/view/pages/order/order.dart';
import 'package:fashio/view/shared/components/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:fashio/view/constants/appConstants.dart';

class AccountScreen extends StatelessWidget {
   AccountScreen({Key? key}) : super(key: key);
  final addressC = Get.put(AddressController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CustomAppBar(
            leading: Center(
                child: HeadTitle(
              text: 'Account',
              fontSize: 20,
            )),
            leadingWidth: 110,
          )),
      body: Column(
        children: [
          GestureDetector(
              onTap: () {
                Get.toNamed('/profile');
              },
              child: CustomListTile(
                  leading: ChangeIconColor.iconPerson, title: 'Profile')),
          GestureDetector(
              onTap: () {
                Get.to(const OrderPage()
                );
              },
              child: CustomListTile(
                  leading: ChangeIconColor.iconBag, title: 'Order')),
          GestureDetector(
            onTap: () {
              addressC.getAddress();

              Get.toNamed('/address');
            },
            child: CustomListTile(
                leading: ChangeIconColor.iconlocation, title: 'Address'),
          ),
          // GestureDetector(
          //   onTap: () {
          //     loginSignInC.logout();
          //   },
          //   child: CustomListTile(
          //       leading: ChangeIconColor.iconLogout, title: 'Logout'),
          // ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? trailing;
  const CustomListTile({
    Key? key,
    required this.leading,
    this.title = '',
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.grey,
      // dense: true,
      leading: leading,
      title: HeadTitle(text: title, fontWeight: FontWeight.bold),
      trailing: trailing ?? const SizedBox(),
    );
  }
}
