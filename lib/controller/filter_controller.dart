

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/model/filter_list.dart';
import 'package:restaurant_app_design/model/sort_list.dart';
import 'package:restaurant_app_design/utils/utility.dart';

class FilterController extends GetxController{
  TextEditingController searchController = TextEditingController();
  ScrollController controllers = ScrollController();
  RxList<SortList> list=sortList.obs;
  RxList<FilterList> filterModelList = filterList.obs;
  RxDouble start = 30.0.obs;
  RxDouble end = 50.0.obs;
  RxBool checkVisibility = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void onChangeEditText(String data){
    if(data.isEmpty){
      checkVisibility.value = true;
    }else {
      checkVisibility.value = false;
    }
    cPrint(" check data = "+data);
  }


}