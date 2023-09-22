
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/ui/widgets/vertical_and_horizontal_gap.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/color.dart';
import 'package:restaurant_app_design/utils/font_utils.dart';
import 'package:restaurant_app_design/utils/route_path.dart';
import 'package:restaurant_app_design/utils/utility.dart';

class ProductDetailsController extends GetxController{
  RxInt quantity=1.obs;
  RxInt prince = 18.obs;
  void onMinusTap(){
    if(quantity.value >1){
      quantity.value = quantity.value -1;
      prince.value = 18 * quantity.value;
    }
  }
  void onPlusTap(){
    if(quantity.value >=1){
      quantity.value = quantity.value +1;
      prince.value = 18 * quantity.value;
    }
  }
  void onTapButtons(){
    Get.toNamed(RoutePath.payment);
  }
  void onTapButton(){
  Get.bottomSheet(bottomSheet(Get.context!,onMinusTap,onPlusTap,onTapButtons));

  }
}