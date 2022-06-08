import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class AppColor {
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kThemeBlue = Color.fromARGB(231, 64, 191, 255);

  static const Color kDarkBlue = Color(0xFF020D4D);
  static const Color kDarkBluePrimary = Color(0xFF223263);

  static const Color kDarkWhite = Color(0xFFE6E6EB);
  static const Color kLightGrey = Color(0xFF9098B1);

  static const Color kDarkGrey = Color(0xFF929499);
  static const Color kYellowStar = Color(0xFFFFC833);
  static const Color kGreen = Color(0xFF008000);
  static const Color kNotificationRose = Color(0xFFFB7181);
  static const Color kerrorRed = Color(0xFFFF6E6E);
  static const Color kstarYellow = Color(0xFFFFC833);
}

class AppSize {
  static const SizedBox kSizedBox5h = SizedBox(height: 5);
  static const SizedBox kSizedBox10h = SizedBox(height: 10);
  static const SizedBox kSizedBox20h = SizedBox(height: 20);
  static const SizedBox kSizedBox10w = SizedBox(width: 10);
  static const SizedBox kSizedBox20w = SizedBox(width: 20);
}

class AppIcons {
  static SvgPicture iconPhone = SvgPicture.asset(
    'assets/icons/smartphone 1.svg',
  );
  static SvgPicture iconPassword = SvgPicture.asset(
    'assets/icons/Password.svg',
  );
  static SvgPicture iconMessage = SvgPicture.asset(
    'assets/icons/messages.svg',
  );
  static SvgPicture iconFavourite = SvgPicture.asset(
    'assets/icons/favourite.svg',
  );
  static SvgPicture iconNotification = SvgPicture.asset(
    'assets/icons/notification.svg',
  );
  static SvgPicture iconHome = SvgPicture.asset(
    'assets/icons/Home.svg',
  );
  static SvgPicture iconSearch = SvgPicture.asset(
    'assets/icons/search.svg',
  );
  static SvgPicture iconCart = SvgPicture.asset(
    'assets/icons/Cart.svg',
  );
  static SvgPicture iconOffer = SvgPicture.asset(
    'assets/icons/Offer.svg',
  );
  static SvgPicture iconPerson = SvgPicture.asset(
    'assets/icons/person.svg',
  );
  static SvgPicture iconStar = SvgPicture.asset(
    'assets/icons/S04tar.svg',
    color: Colors.yellow,
  );
}

class ChangeIconColor {
  static SvgPicture iconHome = SvgPicture.asset(
    'assets/icons/Home.svg',
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconFavourite = SvgPicture.asset(
    'assets/icons/favourite.svg',
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconCart = SvgPicture.asset(
    'assets/icons/Cart.svg',
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconOffer = SvgPicture.asset(
    'assets/icons/Offer.svg',
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconPerson = SvgPicture.asset(
    'assets/icons/person.svg',
    color: AppColor.kThemeBlue,
  );

  // static SvgPicture iconPerson = SvgPicture.asset(
  //   'assets/icons/person.svg',
  //   color: AppColor.kThemeBlue,
  // );

}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List nameList = [
  'Men',
  'Women',
  'Kids',
  'Sarees',
  'Kurtis',
  'Western',
  'Abaya'
];
