import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/restaurant_booking_controller.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/custom_painter.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/route_path.dart';
import 'package:restaurant_app_design/utils/utility.dart';


class RestaurantBookingScreen extends GetView<RestaurantBookingController> {
  const RestaurantBookingScreen({super.key});


  void onTapButtons(){
    cPrint("onTapButtons");

   /* Get.toNamed(RoutePath.review);*/
    Get.toNamed(RoutePath.profile);
  }
  void onTapMoveNextButton(){
    if(StateChange.date == controller.myEnum.value){
      controller.myEnum(StateChange.time);
    }else if(StateChange.time == controller.myEnum.value){
      controller.myEnum(StateChange.person);
    }else if(StateChange.person == controller.myEnum.value){
      controller.myEnum(StateChange.yourInfo);
    }else {
      controller.myEnum(StateChange.bottomSheet);
      Get.bottomSheet(bottomFinalSheetWidget(Get.context!,onTapButtons,controller.time.toString(),controller.person.toString()));
    }

      cPrint(StateChange.bottomSheet.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor: Theme.of(context).bgDarkColor,
      body: CustomPaint(
        painter: CustomPainterTwo(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpacing(10),
                    controller.changeState(controller.myEnum.value),

                    verticalSpacing(50),
                  ],
                ),
              ),
            ),



            customButton(AppText.continues,context,onTapMoveNextButton),
            verticalSpacing(40),
          ],),
      ),
    ));
  }
}
