import 'package:fashio/view/pages/account/account.dart';
import 'package:fashio/view/pages/cart/cart.dart';
import 'package:fashio/view/pages/category_details/category_details.dart';
import 'package:fashio/view/pages/favourite/favourite.dart';
import 'package:fashio/view/pages/filter/filter.dart';
import 'package:fashio/view/pages/flash_sale/flash_sale.dart';
import 'package:fashio/view/pages/home/home_screen.dart';
import 'package:fashio/view/pages/login/login_with_email.dart';
import 'package:fashio/view/pages/login/login_with_mobile.dart';
import 'package:fashio/view/pages/mega_sale/mega_sale.dart';
import 'package:fashio/view/pages/notification/notification.dart';
import 'package:fashio/view/pages/offer/offer.dart';
import 'package:fashio/view/pages/product_detail/product_deatil.dart';
import 'package:fashio/view/pages/profile/profile.dart';
import 'package:fashio/view/pages/register/register_one.dart';
import 'package:fashio/view/pages/review/review_product.dart';
import 'package:fashio/view/pages/review/write_review.dart';
import 'package:fashio/view/pages/search/search.dart';
import 'package:fashio/view/pages/splash/splash_screen.dart';
import 'package:fashio/view/shared/pages/navigatiton_bar/my_navigation_bar.dart';
import 'package:get/get.dart';

import '../pages/more_category.dart/more_category_screen.dart';

class Routes {
  static final routes = [
    GetPage(name: '/', page: () => const MyNavigationBar()),
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/elogin', page: () => LoginEmailScreen()),
    GetPage(name: '/mlogin', page: () => LoginMobileScreen()),

    GetPage(name: '/regOne', page: () => RegisterScreenOne()),
    GetPage(name: '/moreCategory', page: () => MoreCategoryScreen()),

    GetPage(name: '/offer', page: () => OfferScreen()),
    GetPage(name: '/fav', page: () =>  FavouriteScreen()),
    GetPage(name: '/product_detail', page: () => ProductDetailScreen()),
    GetPage(name: '/review_product', page: () => const ReviewProductScreen()),
    GetPage(name: '/write_review', page: () => const WriteReviewScreen()),
    GetPage(name: '/d', page: () => HomeScreen()),
    GetPage(name: '/notification', page: () => NotificationScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    // GetPage(name: '/', page: () => exploreScreen()),
    GetPage(name: '/search', page: () => const SearchScreen()),
    GetPage(name: '/filter', page: () => const FilterScreen()),
    // GetPage(name: '/', page: () => SortbyScreen()),
    GetPage(name: '/cart', page: () => CartScreen()),
    // GetPage(name: '/', page: () => ShipToScreen()),
    // GetPage(name: '/', page: () => PaymentScreen()),
    // GetPage(name: '/', page: () => SuccessScreen())
    GetPage(name: '/offer', page: () => OfferScreen()),
    GetPage(name: '/account', page: () => AccountScreen()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(name: '/flashSale', page: () => FlashSaleScreen()),
    GetPage(name: '/megaSale', page: () => MegaSaleScreen()),
    GetPage(name: '/categoryDetails', page: () => CategoryDetails()),

    // GetPage(name: '/', page: () => OrderScreen()),
    // GetPage(name: '/', page: () => AddressScreen()),
  ];
}
