
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/utils/utility.dart';

class ProductDetailsController extends GetxController{
  RxInt quantity=1.obs;
  void onMinusTap(){
    if(quantity.value >1){
      quantity.value = quantity.value -1;
    }
    cPrint("onMinusTap"+quantity.value.toString());
  }
  void onPlusTap(){
    if(quantity.value >1){
      quantity.value = quantity.value +1;
    }
    cPrint("onPlusTap"+quantity.value.toString());
  }
  void onTapButtons(){
    if(quantity.value >1){
      quantity.value = quantity.value +1;
    }
    cPrint("onPlusTap"+quantity.value.toString());
  }
  void onTapButton(){
    Get.bottomSheet(bottomSheet(Get.context!,onMinusTap,onPlusTap,onTapButtons));

  }
}