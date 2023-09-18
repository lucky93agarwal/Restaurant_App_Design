import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/utils/route_path.dart';

class SliderController extends GetxController{
  final pageController = PageController();
  RxDouble currentPage = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(_handlePageChange);
  }
  void _handlePageChange() {

      currentPage.value = pageController.page!;
      currentPage.refresh();
  }

  void changePage(){
    if(pageController.page! <2){
      currentPage.value = currentPage.value +1;
      pageController.jumpToPage(currentPage.value.toInt());
    }else  if(pageController.page! ==2){
      Get.toNamed(RoutePath.loginScreen);
    }
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}