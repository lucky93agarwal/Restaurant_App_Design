import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/login_screen.dart';
import 'package:restaurant_app_design/ui/sliding_screen.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

// Import the GetX

class ScreenRouter {
  static List<GetPage> routes = [
    //*----------------------- Unauthorized ---------------------------------
    GetPage(
        name: RoutePath.selectLanugaeScreen, page: () => SlidingScreen()),

    GetPage(
        name: RoutePath.loginScreen, page: () => LoginScreen()),
  ];

}