import 'package:get/get.dart';
import 'package:restaurant_app_design/controller/slider_controller.dart';

class GlobalBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => SliderController());
  }
}