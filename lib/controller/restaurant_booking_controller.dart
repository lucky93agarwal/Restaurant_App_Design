import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app_design/ui/widgets/app_bar_widget.dart';
import 'package:restaurant_app_design/utils/app_text.dart';
import 'package:restaurant_app_design/utils/utility.dart';

class RestaurantBookingController extends GetxController {
  RxString title = "Select Date".obs;
  RxString time = "8:30".obs;
  RxInt person = 1.obs;
  Rx<StateChange> myEnum = Rx<StateChange>(StateChange.date);
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void onTabTime(String data) {
    time.value = data;
    cPrint(data);
  }

  void onTabPlus() {
    person.value = person.value + 1;

    cPrint(person.value.toString());
  }

  void onTabMinus() {
    if (person.value != 1) {
      person.value = person.value - 1;
    }
    cPrint(person.value.toString());
  }

  Widget changeState(StateChange fwt) {
    switch (fwt) {
      case StateChange.date:
        return restaurantBookingDateWidget(Get.context!, 1, onTabTime,
            time.value, onTabPlus, onTabMinus, person.value,
            emailController,firstNameController,lastNameController,phoneController);
      case StateChange.time:
        return restaurantBookingDateWidget(Get.context!, 2, onTabTime,
            time.value, onTabPlus, onTabMinus, person.value,
            emailController,firstNameController,lastNameController,phoneController);
      case StateChange.person:
        return restaurantBookingDateWidget(Get.context!, 3, onTabTime,
            time.value, onTabPlus, onTabMinus, person.value,
            emailController,firstNameController,lastNameController,phoneController);
      case StateChange.yourInfo:
        return restaurantBookingDateWidget(Get.context!, 4, onTabTime,
            time.value, onTabPlus, onTabMinus, person.value,
            emailController,firstNameController,lastNameController,phoneController);
      case StateChange.bottomSheet:
        return restaurantBookingDateWidget(Get.context!, 5, onTabTime,
            time.value, onTabPlus, onTabMinus, person.value,
            emailController,firstNameController,lastNameController,phoneController);
    }
  }
}

enum StateChange {
  /// FontWeight -> 900
  date,

  /// FontWeight -> 800
  time,

  /// FontWeight -> 700
  person,

  /// FontWeight -> 500
  yourInfo,
  bottomSheet,
}
