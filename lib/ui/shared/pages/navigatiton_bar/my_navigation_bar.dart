import 'package:fashio/ui/pages/account/account.dart';
import 'package:fashio/ui/pages/cart/cart.dart';
import 'package:fashio/ui/pages/favourite/favourite.dart';
import 'package:fashio/ui/pages/home/home_screen.dart';
import 'package:fashio/ui/pages/offer/offer.dart';
import 'package:fashio/utils/constants.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    OfferScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageIndex,
          onTap: _onNavItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: AppIcons.iconHome,
              label: 'Home',
              activeIcon: ChangeIconColor.iconHome,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.iconOffer,
              label: 'Offer',
              activeIcon: ChangeIconColor.iconOffer,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.iconCart,
              label: 'Cart',
              activeIcon: ChangeIconColor.iconCart1,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.iconFavourite,
              label: 'Favorite',
              activeIcon: ChangeIconColor.iconFavourite,
            ),
            BottomNavigationBarItem(
              icon: AppIcons.iconPerson,
              label: 'Account',
              activeIcon: ChangeIconColor.iconPerson,
            )
          ],
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
            color: AppColor.kThemeBlue,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: AppColor.kWhite,
          ),
          selectedIconTheme: const IconThemeData(color: Colors.red),
          selectedItemColor: AppColor.kThemeBlue,
        ));
  }

  void _onNavItemTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
