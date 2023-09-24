import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/restaurant_booking_controller.dart';
import 'package:restaurant_app_design/model/nearby_best_restaurant.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';


class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  State<RestaurantDetailsScreen> createState() => _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  void onTapMoveNextButton(){

    Get.lazyPut(()=>RestaurantBookingController());
    Get.toNamed(RoutePath.bookRestaurant);

  }
  late Restaurant model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = Get.arguments['model']! as Restaurant;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Stack(
          children: [
            restaurantDetailsWidget(context,model),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: ListView(children: [


                  restaurantTitleWidget(context,model),
                  verticalSpacing(20),
                  horizontalLine(context),
                  verticalSpacing(20),
                  restaurantAddressWidget(context,model),
                  verticalSpacing(20),
                  horizontalLine(context),
                  verticalSpacing(20),
                  restaurantListWidget(context,model),
                ],)),

                customButton(AppText.bookATable,context,onTapMoveNextButton),
                verticalSpacing(40),

              ],),
          ],
        ),
      ),
    );
  }
}
