// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fashio/ui/shared/components/texts.dart';
import 'package:fashio/utils/constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
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
          CustomListTile(leading: ChangeIconColor.iconBag, title: 'Order'),
          CustomListTile(leading: ChangeIconColor.iconlocation, title: 'Address'),
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
    required this.title,
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
