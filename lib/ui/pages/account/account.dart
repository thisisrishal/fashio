// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/ui/pages/order/order.dart';
import 'package:flutter/material.dart';

import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          CustomListTile(leading: ChangeIconColor.iconPerson, title: 'Profile'),
          GestureDetector(
              onTap: () {
                Get.to(const OrderPage());
              },
              child: CustomListTile(
                  leading: ChangeIconColor.iconBag, title: 'Order')),
          CustomListTile(
              leading: ChangeIconColor.iconlocation, title: 'Address'),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Widget leading;
  final String title;
  const CustomListTile({
    Key? key,
    required this.leading,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // tileColor: Colors.grey,
      // dense: true,
      leading: leading,
      title: HeadTitle(text: title, fontWeight: FontWeight.bold),
    );
  }
}
