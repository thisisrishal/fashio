import 'package:fashio/ui/pages/account/account.dart';
import 'package:fashio/ui/pages/cart/cart.dart';
import 'package:fashio/ui/pages/favourite/favourite.dart';
import 'package:fashio/ui/pages/filter/filter.dart';
import 'package:fashio/ui/pages/home/home_screen.dart';
import 'package:fashio/ui/pages/login/login.dart';
import 'package:fashio/ui/pages/notification/notification.dart';
import 'package:fashio/ui/pages/offer/offer.dart';
import 'package:fashio/ui/pages/product_detail/product_deatil.dart';
import 'package:fashio/ui/pages/register/register.dart';
import 'package:fashio/ui/pages/review/review_product.dart';
import 'package:fashio/ui/pages/review/write_review.dart';
import 'package:fashio/ui/pages/search/search.dart';
import 'package:fashio/ui/pages/splash/splash_screen.dart';
import 'package:fashio/ui/shared/pages/navigatiton_bar/my_navigation_bar.dart';
import 'package:get/get.dart';
class Routes {
  static final routes = [
    GetPage(name: '/', page: () => MyNavigationBar()),
    GetPage(name: '/splash', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
    GetPage(name: '/register', page: () => RegisterScreen()),
    GetPage(name: '/offer', page: () => OfferScreen()),
    GetPage(name: '/fav', page: () => const FavouriteScreen()),
    GetPage(name: '/product_detail', page: () => ProductDetailScreen()),
    GetPage(name: '/review_product', page: () => const ReviewProductScreen()),
    GetPage(name: '/write_review', page: () => const WriteReviewScreen()),
    GetPage(name: '/d', page: () => HomeScreen()),
    GetPage(name: '/notification', page: () => const NotificationScreen()),
    GetPage(name: '/home', page: () => HomeScreen()),
    // GetPage(name: '/', page: () => exploreScreen()),
    GetPage(name: '/search', page: () => const SearchScreen()),
    GetPage(name: '/filter', page: () => const FilterScreen()),
    // GetPage(name: '/', page: () => SortbyScreen()),
    GetPage(name: '/d', page: () => const CartScreen()),
    // GetPage(name: '/', page: () => ShipToScreen()),
    // GetPage(name: '/', page: () => PaymentScreen()),
    // GetPage(name: '/', page: () => SuccessScreen()),
    GetPage(name: '/d', page: () => OfferScreen()),
    GetPage(name: '/d', page: () => const AccountScreen()),
    // GetPage(name: '/', page: () => ProfileScreen()),
    // GetPage(name: '/', page: () => OrderScreen()),
    // GetPage(name: '/', page: () => AddressScreen()),
  ];
}
