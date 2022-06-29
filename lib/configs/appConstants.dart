// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fashio/configs/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:fashio/ui/shared/components/texts.dart';

class Logo2 extends StatelessWidget {
  const Logo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Image.asset(
      'assets/images/logo2.png',
      height: 72.sp,
      width: 72.sp,
    ));
  }
}
  SystemUiOverlayStyle customOverlayStyle(
          Color barColor, Brightness brightness) =>
      SystemUiOverlayStyle(
          statusBarColor: barColor, statusBarIconBrightness: brightness);


// SystemUiOverlayStyle customStatusBarStyle() {
//   return const SystemUiOverlayStyle(
//       statusBarColor: Colors.white,
//       systemNavigationBarIconBrightness: Brightness.dark,
//       statusBarIconBrightness: Brightness.dark);
// }

class AppColor {
  static const Color kWhite = Color(0xFFFFFFFF);
  static const Color kThemeBlue = Color.fromARGB(229, 64, 191, 255);
  static const Color kLightBlue = Color.fromARGB(113, 64, 191, 255);
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
  static const Color kblack = Colors.black;
  static const Color blueGrey = Colors.blueGrey;

}

class AppSize {
  static const SizedBox kSizedBox5h = SizedBox(height: .4);
  static const SizedBox kSizedBox5w = SizedBox(width: 5);
  static SizedBox kSizedBox10h = SizedBox(height: 1.h);
  static SizedBox kSizedBox20h = SizedBox(height: 3.h);
  static const SizedBox kSizedBox10w = SizedBox(width: 10);
  static const SizedBox kSizedBox20w = SizedBox(width: 20);
}

class AppIcons {
  static SvgPicture iconPhone =
      SvgPicture.asset('assets/icons/smartphone 1.svg');
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
  // static SvgPicture iconCart = SvgPicture.asset(
  //   'assets/icons/Cart.svg',
  // );
  static Icon iconCart = const Icon(
    Icons.shopping_cart_outlined,
    color: AppColor.kLightGrey,
  );
  static SvgPicture iconOffer = SvgPicture.asset(
    'assets/icons/Offer.svg',
  );
  static SvgPicture iconPerson = SvgPicture.asset(
    'assets/icons/person.svg',
  );
  static SvgPicture iconStar = SvgPicture.asset(
    'assets/icons/S04tar.svg',
    color: Colors.amber,
  );
  static SvgPicture iconDelete = SvgPicture.asset(
    'assets/icons/Trash.svg',
  );
  static SvgPicture icondown = SvgPicture.asset(
    'assets/icons/svgviewer-output.svg',
// height: 8.sp,
  );
  static SvgPicture iconMic = SvgPicture.asset(
    'assets/icons/mic.svg',
  );
  static Icon iconBack = const Icon(
    Icons.chevron_left,
    color: AppColor.kLightGrey,
  );

  static Icon iconMore = const Icon(
    Icons.more_vert_rounded,
    color: Colors.grey,
  );
  static SvgPicture iconSort = SvgPicture.asset(
    'assets/icons/sort.svg',
  );

  static SvgPicture iconNotFound = SvgPicture.asset(
    'assets/icons/Not_Found.svg',
    height: 84.sp,
    width: 84.sp,
  );
  static Icon iconClose = const Icon(
    Icons.close,
    color: Colors.grey,
  );
}

class ChangeIconColor {
  static Icon iconCart1 = const Icon(
    Icons.shopping_cart_outlined,
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconHome = SvgPicture.asset(
    'assets/icons/Home.svg',
    color: AppColor.kThemeBlue,
  );
  static SvgPicture iconFavourite = SvgPicture.asset(
    'assets/icons/favourite.svg',
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
  static SvgPicture iconBag = SvgPicture.asset(
    'assets/icons/bag.svg',
  );
  static SvgPicture iconlocation = SvgPicture.asset(
    'assets/icons/location.svg',
  );
  static SvgPicture iconFilter = SvgPicture.asset(
    'assets/icons/filter.svg',
  );
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

List<String> nameList = [
  'Men',
  'Women',
  'Kids',
  'Sarees',
  'Kurtis',
  'Western',
  'Abaya'
];

List<String> sizeList = ['S', 'M', 'L', 'XL'];

List<String> qtyList = ['1', '2', '3'];

List<Color> colorList = [
  Colors.yellow,
  Colors.blue,
  Colors.pink,
  Colors.green,
  Colors.purple[900]!,
];

List<Widget> starList = [
  const CustomRatings(text: 'All Review', star: false),
  const CustomRatings(text: '5'),
  const CustomRatings(text: '4'),
  const CustomRatings(text: '3'),
  const CustomRatings(text: '2'),
  const CustomRatings(text: '1'),
];

final BorderRadius customBorderRadius4 = BorderRadius.circular(4.sp);

class CustomAppBar extends StatelessWidget {
  final Widget? leading;
  final String title;
  
  final Widget? trailing;
  final Widget? trailing2;
  final double? leadingWidth;
  final VoidCallback? trailing2OnTap;

  const CustomAppBar(
      {Key? key,
      this.leading,
      this.title = '',
      this.trailing,
      this.trailing2,
      this.leadingWidth,
      this.trailing2OnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: HeadTitle(text: 'Fashio',fontSize: 20,),
      leadingWidth: leadingWidth ?? 44,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: leading,
      ),
      title: HeadTitle(
        text: title,
        fontSize: 13.sp,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(215, 2, 13, 77),
      ),

      actions: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: trailing2OnTap ?? () {},
                  child: trailing2 ?? Container(),
                )),
            // AppSize.kSizedBox10w,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: trailing)
          ],
        )
      ],
      backgroundColor: AppColor.kWhite,
      elevation: .4,
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final String text;
  const CustomElevatedButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.w,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.kThemeBlue.withOpacity(.5),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
        color: AppColor.kThemeBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: HeadTitle(
          text: text,
          color: AppColor.kWhite,
        ),
      ),
    );
  }
}

class PrizeListRow extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  const PrizeListRow({
    Key? key,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [leading, trailing],
      ),
    );
  }
}
