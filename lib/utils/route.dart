import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/screen/add_card_screen.dart';
import 'package:restaurant_app_design/ui/screen/best_offer_screen.dart';
import 'package:restaurant_app_design/ui/screen/create_user_profile_screen.dart';
import 'package:restaurant_app_design/ui/screen/favourite_screen.dart';
import 'package:restaurant_app_design/ui/screen/filter_screen.dart';
import 'package:restaurant_app_design/ui/screen/forgot_pass_screen.dart';
import 'package:restaurant_app_design/ui/screen/home_screen.dart';
import 'package:restaurant_app_design/ui/screen/list_screen.dart';
import 'package:restaurant_app_design/ui/screen/order_summary_screen.dart';
import 'package:restaurant_app_design/ui/screen/payment_method_screen.dart';
import 'package:restaurant_app_design/ui/screen/product_details_screen.dart';
import 'package:restaurant_app_design/ui/screen/promocode_screen.dart';
import 'package:restaurant_app_design/ui/screen/search_screen.dart';
import 'package:restaurant_app_design/ui/screen/signup_screen.dart';
import 'package:restaurant_app_design/ui/screen/sliding_screen.dart';
import 'package:restaurant_app_design/ui/screen/track_order_screen.dart';
import 'package:restaurant_app_design/ui/screen/verification_screen.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

import '../ui/screen/login_screen.dart';

// Import the GetX

class ScreenRouter {
  static List<GetPage> routes = [
    //*----------------------- Unauthorized ---------------------------------
    GetPage(
        name: RoutePath.selectLanguageScreen, page: () =>const SlidingScreen()),

    GetPage(
        name: RoutePath.loginScreen, page: () =>const LoginScreen()),


    GetPage(
        name: RoutePath.forgotScreen, page: () =>const ForgotPasswordScreen()),


    GetPage(
        name: RoutePath.signupScreen, page: () =>const SignUpScreen()),
    GetPage(
        name: RoutePath.verifyScreen, page: () =>const VerificationScreen()),


    GetPage(
        name: RoutePath.createUserProfileScreen, page: () =>const CreateUserProfileScreen()),


    GetPage(
        name: RoutePath.homeScreen, page: () =>const HomeScreen()),

    GetPage(
        name: RoutePath.searchScreen, page: () =>const SearchScreen()),


    GetPage(
        name: RoutePath.listScreen, page: () =>const ListScreen()),


    GetPage(
        name: RoutePath.filterScreen, page: () =>const FilterScreen()),



    GetPage(
        name: RoutePath.productDetails, page: () =>const ProductDetailsScreen()),
    GetPage(
        name: RoutePath.bestOffer, page: () =>const BestOfferScreen()),


    GetPage(
        name: RoutePath.favourite, page: () =>const FavouriteScreen()),


    GetPage(
        name: RoutePath.payment, page: () =>const PaymentMethodScreen()),


    GetPage(
        name: RoutePath.promoCode, page: () =>const PromoCodeScreen()),


    GetPage(
        name: RoutePath.addCard, page: () =>const AddCardScreen()),



    GetPage(
        name: RoutePath.orderSummary, page: () =>const OrderSummaryScreen()),


    GetPage(
        name: RoutePath.trackOrder, page: () =>const TrackOrderScreen()),
  ];

}